//
//  MockCreditScoreService.swift
//  InbankAssignmentTests
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation
@testable import InbankAssignment

class MockCreditScoreService: CreditScoreService {
    var creditScore = CreditSegment.debt

    func getCreditScore(for personalId: String) -> CreditSegment {
        return creditScore
    }
}
