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

    }
}
