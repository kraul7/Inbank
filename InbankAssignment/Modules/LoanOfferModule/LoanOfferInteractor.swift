//
//  LoanOfferInteractor.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

class LoanOfferInteractor: LoanOfferInteractorInput {
    weak var presenter: LoanOfferInteractorOutput?

    private let amount: Int?
    private let period: Int?

    init(amount: Int, period: Int) {
        self.amount = amount
        self.period = period
    }

    init() {
        amount = nil
        period = nil
    }

    func getOffer() {
        if let amount = amount, let period = period {
            presenter?.showOffer(amount: amount, period: period)
        } else {
            presenter?.showSorryView()
        }
    }
}
