//
//  LoanOfferProtocols.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

// MARK: View
protocol LoanOfferPresenterOutput: AnyObject {
    var presenter: LoanOfferPresenterInput! { get set }

    func showSorryView()
    func showOffer(amount: Int, period: Int)
}

// MARK: Presenter
protocol LoanOfferPresenterInput: AnyObject {
    var view: LoanOfferPresenterOutput? { get set }
    var interactor: LoanOfferInteractorInput { get set }
    var router: LoanOfferRouting { get set }

    func didAppear()
}

typealias LoanOfferPresenterProtocol = LoanOfferPresenterInput & LoanOfferInteractorOutput

// MARK: Interactor
protocol LoanOfferInteractorInput: AnyObject {
    var presenter: LoanOfferInteractorOutput? { get set }

    func getOffer()
}

protocol LoanOfferInteractorOutput: AnyObject {
    func showSorryView()
    func showOffer(amount: Int, period: Int)
}

// MARK: Router
protocol LoanOfferRouting: AnyObject {

}
