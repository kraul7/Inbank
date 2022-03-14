//
//  LoanApplicationPresenter.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

class LoanApplicationPresenter: LoanApplicationPresenterProtocol {
    weak var view: LoanApplicationPresenterOutput?
    var interactor: LoanApplicationInteractorInput
    var router: LoanApplicationRouting

    init(view: LoanApplicationPresenterOutput?,
         interactor: LoanApplicationInteractorInput,
         router: LoanApplicationRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func didSubmit(amount: Int, period: Int, personalId: String) {

    }

    func showAmountError(with text: String) {

    }

    func showPeriodError(with text: String) {

    }

    func showPersonalIdError(with text: String) {

    }

    func approvedOffer(amount: Int, period: Int) {

    }

    func offerDeclined() {

    }
}
