//
//  LoanOfferViewController.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit
import PureLayout

class LoanOfferViewController: UIViewController {
    var presenter: LoanOfferPresenterInput!

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .blue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter.didAppear()
    }
}

extension LoanOfferViewController: LoanOfferPresenterOutput {
    func showSorryView() {

    }

    func showOffer(amount: Int, period: Int) {

    }
}
