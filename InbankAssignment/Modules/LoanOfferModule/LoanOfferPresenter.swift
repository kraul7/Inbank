//
//  LoanOfferPresenter.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

class LoanOfferPresenter: LoanOfferPresenterInput {
    weak var view: LoanOfferPresenterOutput?
    var interactor: LoanOfferInteractorInput
    var router: LoanOfferRouting

    init(view: LoanOfferPresenterOutput?,
         interactor: LoanOfferInteractorInput,
         router: LoanOfferRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func didAppear() {
        interactor.getOffer()
    }
}

extension LoanOfferPresenter: LoanOfferInteractorOutput {
    func showSorryView() {
        view?.showSorryView()
    }

    func showOffer(amount: Int, period: Int) {
        view?.showOffer(amount: amount, period: period)
    }
}
