//
//  LoanApplicationValidator.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

class LoanApplicationValidator {
    private let constraints: LoanConstraints

    init(with constraints: LoanConstraints) {
        self.constraints = constraints
    }

    func isValid(_ application: LoanApplication) -> Bool {
        return isAmountValid(application.amount) && isPeriodValid(application.period) && isPersonalCodeValid(application.clientPersonalId)
    }

    func isAmountValid(_ amount: Int) -> Bool {
        return amount >= constraints.minAmount && amount <= constraints.maxAmount
    }

    func isPeriodValid(_ period: Int) -> Bool {
        return period >= constraints.minPeriod && period <= constraints.maxPeriod
    }

    func isPersonalCodeValid(_ code: String) -> Bool {
        return code.count == 11
    }
}
