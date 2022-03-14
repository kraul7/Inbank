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
        view?.showLoading()
        interactor.submitApplication(amount: amount, period: period, personalId: personalId)
    }

    func showAmountError(with text: String) {
        view?.hideLoading()
        view?.showAmountError(with: text)
    }

    func showPeriodError(with text: String) {
        view?.hideLoading()
        view?.showPeriodError(with: text)
    }

    func showPersonalIdError(with text: String) {
        view?.hideLoading()
        view?.showPersonalIdError(with: text)
    }

    func approvedOffer(amount: Int, period: Int) {
        view?.hideLoading()
        router.routeToLoanOffer(amount: amount, period: period)
    }

    func offerDeclined() {
        view?.hideLoading()
        router.routeToDeclinedOffer()

    }
}
