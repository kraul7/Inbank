//
//  LoanApplicationPresenterTests.swift
//  InbankAssignmentTests
//
//  Created by Raul Kuusik on 14.03.2022.
//

import XCTest
@testable import InbankAssignment

class LoanApplicationPresenterTests: XCTestCase {
    private var view = MockLoanApplicationView()
    private var interactor = MockLoanApplicationInteractor()
    private var router = MockLoanApplicationRouter()

    override func setUp() {
        super.setUp()

        view = MockLoanApplicationView()
        interactor = MockLoanApplicationInteractor()
        router = MockLoanApplicationRouter()
    }

    func testCallingDidSubmitSendsDataToInteractor() {
        let presenter = LoanApplicationPresenter(view: view,
                                                 interactor: interactor,
                                                 router: router)

        presenter.didSubmit(amount: 1, period: 1, personalId: "123")
        XCTAssertTrue(interactor.didCallSubmitApplication)
    }

    func testGettingDeclinedOfferRoutesToDecline() {
        let presenter = LoanApplicationPresenter(view: view,
                                                 interactor: interactor,
                                                 router: router)

        presenter.offerDeclined()

        XCTAssertTrue(router.didCallRouteToDeclinedOffer)
    }

    func testGettingOfferRoutesToOffer() {
        let presenter = LoanApplicationPresenter(view: view,
                                                 interactor: interactor,
                                                 router: router)

        presenter.approvedOffer(amount: 1, period: 1)

        XCTAssertTrue(router.didCallRouteToLoanOffer)

    }

    func testGettingAmountErrorTellsViewToShowError() {
        let presenter = LoanApplicationPresenter(view: view,
                                                 interactor: interactor,
                                                 router: router)

        presenter.showAmountError(with: "asd")

        XCTAssertEqual("asd", view.amountError)
    }
}
