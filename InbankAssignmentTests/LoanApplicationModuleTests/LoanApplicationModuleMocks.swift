//
//  File.swift
//  InbankAssignmentTests
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation
@testable import InbankAssignment

// MARK: View
class MockLoanApplicationView: LoanApplicationPresenterOutput {
    var presenter: LoanApplicationPresenterInput!
    private(set) var didSetLoading = false
    private(set) var didSetHideLoading = false
    private(set) var amountError: String?
    private(set) var periodError: String?
    private(set) var personalIdError: String?

    func showLoading() {
        didSetLoading = true
    }

    func hideLoading() {
        didSetHideLoading = true
    }

    func showAmountError(with text: String) {
        amountError = text
    }

    func showPeriodError(with text: String) {
        periodError = text
    }

    func showPersonalIdError(with text: String) {
        personalIdError = text
    }
}

// MARK: Interactor
class MockLoanApplicationInteractor: LoanApplicationInteractorInput {
    var presenter: LoanApplicationInteractorOutput?
    private(set) var didCallSubmitApplication = false

    func submitApplication(amount: Int, period: Int, personalId: String) {
        didCallSubmitApplication = true
    }
}

// MARK: Router
class MockLoanApplicationRouter: LoanApplicationRouting {
    private(set) var didCallRouteToDeclinedOffer = false
    private(set) var didCallRouteToLoanOffer = false

    func routeToDeclinedOffer() {
        didCallRouteToDeclinedOffer = true
    }

    func routeToLoanOffer(amount: Int, period: Int) {
        didCallRouteToLoanOffer = true
    }
}

// MARK: Presenter
class MockLoanApplicationPresenter: LoanApplicationPresenterProtocol {
    var view: LoanApplicationPresenterOutput?

    var interactor: LoanApplicationInteractorInput

    var router: LoanApplicationRouting

    private(set) var didCallDidSubmit = false
    private(set) var didCallShowAmountError = false
    private(set) var didCallPeriodError = false
    private(set) var didCallPersonalIdError = false
    private(set) var didCallApprovedOffer = false
    private(set) var didCallOfferDeclined = false

    init(view: LoanApplicationPresenterOutput?, interactor: LoanApplicationInteractor, router: LoanApplicationRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router

    }

    func didSubmit(amount: Int, period: Int, personalId: String) {
        didCallDidSubmit = true
    }

    func showAmountError(with text: String) {
        didCallShowAmountError = true
    }

    func showPeriodError(with text: String) {
        didCallPeriodError = true
    }

    func showPersonalIdError(with text: String) {
        didCallPersonalIdError = true
    }

    func approvedOffer(amount: Int, period: Int) {
        didCallApprovedOffer = true
    }

    func offerDeclined() {
        didCallOfferDeclined = true
    }
}
