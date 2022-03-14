//
//  LoanApplicationInteractor.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

class LoanApplicationInteractor: LoanApplicationInteractorInput {
    weak var presenter: LoanApplicationInteractorOutput?
    private let decisionService: DecisionService
    private let applicationValidator: LoanApplicationValidator
    private let constraints: LoanConstraints

    init(decisionService: DecisionService, constraints: LoanConstraints) {
        self.decisionService = decisionService
        self.constraints = constraints
        applicationValidator = LoanApplicationValidator(with: constraints)
    }

    func submitApplication(amount: Int, period: Int, personalId: String) {
        guard isApplicationValid(amount: amount, period: period, personalId: personalId) else { return }

        decisionService.getMaximumLoanSum(application: LoanApplication(amount: amount,
                                                                       period: period,
                                                                       clientPersonalId: personalId),
                                          completion: { [weak self] result in
            guard let self = self else { return }

            switch result {

            case .success(let decision):
                self.presenter?.approvedOffer(amount: decision.amount, period: decision.period)
            case .failure(_):
                // todo: handle error cases
                self.presenter?.offerDeclined()
            }
        })
    }

    private func isApplicationValid(amount: Int, period: Int, personalId: String) -> Bool {
        var isValid = true

        if !applicationValidator.isAmountValid(amount) {
            presenter?.showAmountError(with: String.init(format: "Amount has to be between %d - %d €", constraints.minAmount, constraints.maxAmount))

            isValid = false
        }

        if !applicationValidator.isPeriodValid(period) {
            presenter?.showPeriodError(with: String.init(format: "Period has to be beteen %d - %d", constraints.minPeriod, constraints.maxPeriod))

            isValid = false
        }

        if !applicationValidator.isPersonalCodeValid(personalId) {
            presenter?.showPersonalIdError(with: "Personal code is invalid")

            isValid = false
        }

        return isValid
    }
}
