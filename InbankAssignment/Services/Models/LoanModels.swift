//
//  LoanModels.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

struct LoanApplication {
    let amount: Int
    let period: Int
    let clientPersonalId: String
}

struct LoanOffer {
    let amount: Int
    let period: Int
}
