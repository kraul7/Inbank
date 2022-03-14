//
//  DecisionEngine.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

enum DecisionError: Error {
    case invalidApplication
    case notViable
}

protocol DecisionEngine {
    func getMaximumLoanSum(application: LoanApplication) -> Result<LoanOffer, DecisionError>
}

class DecisionEngineImpl: DecisionEngine {
    private let creditScoreService: CreditScoreService
    private let constraints: LoanConstraints
    private let validator: LoanApplicationValidator

    init(creditScoreService: CreditScoreService, constraints: LoanConstraints) {
        self.creditScoreService = creditScoreService
        self.constraints = constraints
        validator = LoanApplicationValidator(with: constraints)
    }

    func getMaximumLoanSum(application: LoanApplication) -> Result<LoanOffer, DecisionError> {
        guard validator.isValid(application) else { return .failure(.invalidApplication) }

        let creditScore = creditScoreService.getCreditScore(for: application.clientPersonalId)

        guard creditScore != .debt else  { return .failure(.notViable) }

        if isViable(creditScore: creditScore.rawValue, amount: application.amount, periodInMonths: application.period) {
            return generateOfferWithMaximumLoanSum(application, creditScore)
        } else {
            return generateOfferWithFirstValidPeriod(application, creditScore)
        }
    }

    private func generateOfferWithMaximumLoanSum(_ application: LoanApplication, _ creditScore: CreditSegment) -> (Result<LoanOffer, DecisionError>) {
        var maxViableAmount = application.amount

        while (maxViableAmount < constraints.maxAmount) {
            if isViable(creditScore: creditScore.rawValue,
                        amount: application.amount + constraints.step,
                        periodInMonths: application.period) {
                maxViableAmount += constraints.step
            } else {
                break
            }
        }

        return (.success(LoanOffer(amount: maxViableAmount, period: application.period)))
    }

    private func generateOfferWithFirstValidPeriod(_ application: LoanApplication, _ creditScore: CreditSegment) -> Result<LoanOffer, DecisionError> {
        var firstPeriodForViableLoan: Int?

        for i in stride(from: application.period+1, through: constraints.maxPeriod+1, by: 1) {
            if isViable(creditScore: creditScore.rawValue, amount: application.amount, periodInMonths: i) {
                firstPeriodForViableLoan = i
                break
            }
        }

        if let period = firstPeriodForViableLoan {
            return .success(LoanOffer(amount: application.amount, period: period))
        } else {
            return .failure(.notViable)
        }
    }

    private func isViable(creditScore: Int, amount: Int, periodInMonths: Int) -> Bool {
        return Double(creditScore) / Double(amount) * Double(periodInMonths) >= 1
    }
}

