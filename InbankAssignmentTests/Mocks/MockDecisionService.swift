//
//  MockDecisionService.swift
//  InbankAssignmentTests
//
//  Created by Raul Kuusik on 14.03.2022.
//

import XCTest
@testable import InbankAssignment

class MockDecisionService: DecisionService {
    private(set) var didCallGetMaximumLoanSum = false
    var returnError = false

    func getMaximumLoanSum(application: LoanApplication, completion: @escaping (Result<LoanOffer, DecisionError>) -> Void) {
        didCallGetMaximumLoanSum = true

        if returnError {
            completion(.failure(.invalidApplication))
        } else {
            completion(.success(.init(amount: 1, period: 1)))
        }
    }
}
