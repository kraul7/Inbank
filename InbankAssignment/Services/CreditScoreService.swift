//
//  CreditScoreService.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

protocol CreditScoreService {
    func getCreditScore(for personalId: String) -> CreditSegment
}

enum CreditSegment: Int {
    case debt = 0,
    segment1 = 100,
    segment2 = 300,
    segment3 = 1000
}

class DummyCreditScoreService: CreditScoreService {
    func getCreditScore(for personalId: String) -> CreditSegment {
        switch personalId {
        case "49002010976":
            return .segment1
        case "49002010987":
            return .segment2
        case "49002010998":
            return .segment3
        default:
            return .debt
        }
    }
}
