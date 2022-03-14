//
//  LoanApplicationProtoocols.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

// MARK: View
protocol LoanApplicationPresenterOutput: AnyObject {
    var presenter: LoanApplicationPresenterInput! { get set }

    func showLoading()
    func hideLoading()
    func showAmountError(with text: String)
    func showPeriodError(with text: String)
    func showPersonalIdError(with text: String)
}

// MARK: Presenter
protocol LoanApplicationPresenterInput: AnyObject {
    var view: LoanApplicationPresenterOutput? { get set }
    var interactor: LoanApplicationInteractorInput { get set }
    var router: LoanApplicationRouting { get set }

    func didSubmit(amount: Int, period: Int, personalId: String)
}

typealias LoanApplicationPresenterProtocol = LoanApplicationPresenterInput & LoanApplicationInteractorOutput

// MARK: Interactor
protocol LoanApplicationInteractorInput: AnyObject {
    var presenter: LoanApplicationInteractorOutput? { get set }

    func submitApplication(amount: Int, period: Int, personalId: String)
}

protocol LoanApplicationInteractorOutput: AnyObject {
    func showAmountError(with text: String)
    func showPeriodError(with text: String)
    func showPersonalIdError(with text: String)
    func approvedOffer(amount: Int, period: Int)
    func offerDeclined()
}

// MARK: Router
protocol LoanApplicationRouting: AnyObject {
    func routeToDeclinedOffer()
    func routeToLoanOffer(amount: Int, period: Int)
}
