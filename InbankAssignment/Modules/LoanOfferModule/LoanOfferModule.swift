//
//  LoanOfferModule.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit

class LoanOfferModule {
    private var view: LoanOfferPresenterOutput
    private var router: LoanOfferRouting
    private var interactor: LoanOfferInteractorInput
    private var presenter: LoanOfferPresenterProtocol

    init(view: LoanOfferPresenterOutput,
         router: LoanOfferRouting,
         interactor: LoanOfferInteractorInput,
         presenter: LoanOfferPresenterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.presenter = presenter
    }
}

extension LoanOfferModule: AppModule {
    func assemble() -> UIViewController? {
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        view.presenter = presenter

        return view as? UIViewController
    }
}
