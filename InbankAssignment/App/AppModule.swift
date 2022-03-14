//
//  AppModule.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit

protocol AppModule {
    func assemble() -> UIViewController?
}

protocol ModuleFactory {
    func makeLoanApplication(with navigationController: UINavigationController) -> LoanApplicationModule
    func makeLoanOffer(with navigationController: UINavigationController, amount: Int, period: Int) -> LoanOfferModule
    func makeSorryOffer(with navigationController: UINavigationController) -> LoanOfferModule
}

struct ModuleFactoryImpl: ModuleFactory {
    let loanConstraints = LoanConstraints(minAmount: 2000, maxAmount: 10000, minPeriod: 12, maxPeriod: 60, step: 100)

    func makeLoanApplication(with navigationController: UINavigationController) -> LoanApplicationModule {
        let router = LoanApplicationRouter(navigationController: navigationController, moduleFactory: self)
        let view = LoanApplicationViewController()

        let decisionEngine = DecisionEngineImpl(creditScoreService: DummyCreditScoreService(),
                                                constraints: loanConstraints)
        let decisionService = DummyDecisionService(decisionEngine: decisionEngine)

        let interactor = LoanApplicationInteractor(decisionService: decisionService, constraints: loanConstraints)
        let presenter = LoanApplicationPresenter(view: view, interactor: interactor, router: router)

        return LoanApplicationModule(view: view,
                                     router: router,
                                     interactor: interactor,
                                     presenter: presenter)
    }

    func makeLoanOffer(with navigationController: UINavigationController, amount: Int, period: Int) -> LoanOfferModule {
        let router = LoanOfferRouter(navigationController: navigationController, moduleFactory: self)
        let view = LoanOfferViewController()
        let interactor = LoanOfferInteractor(amount: amount, period: period)
        let presenter = LoanOfferPresenter(view: view, interactor: interactor, router: router)

        return LoanOfferModule(view: view, router: router, interactor: interactor, presenter: presenter)
    }

    func makeSorryOffer(with navigationController: UINavigationController) -> LoanOfferModule {
        let router = LoanOfferRouter(navigationController: navigationController, moduleFactory: self)
        let view = LoanOfferViewController()
        let interactor = LoanOfferInteractor()
        let presenter = LoanOfferPresenter(view: view, interactor: interactor, router: router)

        return LoanOfferModule(view: view, router: router, interactor: interactor, presenter: presenter)
    }
}
