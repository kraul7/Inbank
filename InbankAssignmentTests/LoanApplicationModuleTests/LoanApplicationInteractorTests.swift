//
//  LoanApplicationInteractorTests.swift
//  InbankAssignmentTests
//
//  Created by Raul Kuusik on 14.03.2022.
//

import XCTest
@testable import InbankAssignment

class LoanApplicationInteractorTests: XCTestCase {
    func testCallingDidSubmitCallsDecisionServiceWhenApplicationValuesAreBetweenConstraints() {
        let decisionService = MockDecisionService()
        let constrains = LoanConstraints(minAmount: 1, maxAmount: 10, minPeriod: 1, maxPeriod: 10, step: 1)

        let interactor = LoanApplicationInteractor(decisionService: decisionService, constraints: constrains)
        let router = MockLoanApplicationRouter()
        let presenter = MockLoanApplicationPresenter(view: nil, interactor: interactor, router: router)
        presenter.interactor = interactor

        interactor.submitApplication(amount: 1, period: 1, personalId: "11111111111")
        
        XCTAssertTrue(decisionService.didCallGetMaximumLoanSum)
    }
}

