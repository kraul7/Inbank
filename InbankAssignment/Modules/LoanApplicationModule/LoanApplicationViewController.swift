//
//  LoanApplicationViewController.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit

class LoanApplicationViewController: UIViewController {
    var presenter: LoanApplicationPresenterInput!

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .purple
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoanApplicationViewController: LoanApplicationPresenterOutput {
    func showLoading() {

    }

    func hideLoading() {

    }

    func showAmountError(with text: String) {

    }

    func showPeriodError(with text: String) {

    }

    func showPersonalIdError(with text: String) {

    }
}
