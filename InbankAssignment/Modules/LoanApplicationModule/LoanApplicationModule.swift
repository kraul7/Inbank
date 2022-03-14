//
//  LoanApplicationModule.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit

class LoanApplicationModule {
    private var view: LoanApplicationPresenterOutput
    private var router: LoanApplicationRouting
    private var interactor: LoanApplicationInteractorInput
    private var presenter: LoanApplicationPresenterProtocol

    init(view: LoanApplicationPresenterOutput,
         router: LoanApplicationRouting,
         interactor: LoanApplicationInteractorInput,
         presenter: LoanApplicationPresenterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.presenter = presenter
    }
}

extension LoanApplicationModule: AppModule {
    func assemble() -> UIViewController? {
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        view.presenter = presenter

        return view as? UIViewController
    }
}
