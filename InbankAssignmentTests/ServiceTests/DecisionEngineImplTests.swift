//
//  DecisionEngineTests.swift
//  InbankAssignmentTests
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation
@testable import InbankAssignment
import XCTest

final class DecisionEngineImplTests: XCTestCase {
    private let constraints = LoanConstraints(minAmount: 2000,
                                      maxAmount: 10000,
                                      minPeriod: 12,
                                      maxPeriod: 60,
                                      step: 100)
    private let creditScoreService = MockCreditScoreService()

    func testThatApplicationWithAmountLowerThanConstrainsMinAmountGetsRejected() {
        creditScoreService.creditScore = .segment3
        let decisionEngine = DecisionEngineImpl(creditScoreService: creditScoreService, constraints: constraints)
        let application = LoanApplication(amount: 123, period: 12, clientPersonalId: "11111111111")

        let result = decisionEngine.getMaximumLoanSum(application: application)

        switch result {

        case .success(_):
            XCTFail("application amount lower than constraints.min should not get positive decision")
        case .failure(let error):
            XCTAssertEqual(error, .invalidApplication)
        }
    }

    func testThatApplicationWithAmountHigherThanConstrainsMaxAmountGetsRejected() {
        creditScoreService.creditScore = .segment3
        let decisionEngine = DecisionEngineImpl(creditScoreService: creditScoreService, constraints: constraints)
        let application = LoanApplication(amount: 50000, period: 12, clientPersonalId: "11111111111")

        let result = decisionEngine.getMaximumLoanSum(application: application)

        switch result {

        case .success(_):
            XCTFail("application amount higher than constraints.max should not get positive decision")
        case .failure(let error):
            XCTAssertEqual(error, .invalidApplication)
        }
    }
}

