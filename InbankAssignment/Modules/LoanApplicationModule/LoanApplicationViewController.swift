//
//  LoanApplicationViewController.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit
import PureLayout

class LoanApplicationViewController: UIViewController {
    var presenter: LoanApplicationPresenterInput!
    private let amountField = LoanDataField(title: "Amount")
    private let periodField = LoanDataField(title: "Period")
    private let personalIdField = LoanDataField(title: "Personal ID code")
    private var loadingIndicator = UIActivityIndicatorView(style: .large)

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white

        let container = UIStackView().configured(axis: .vertical, alignment: .center, distribution: .fillEqually, spacing: 10)
        view.addSubview(container)
        container.autoCenterInSuperview()
        container.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        container.autoPinEdge(toSuperviewEdge: .right, withInset: 20)

        container.addArrangedSubview(amountField)
        amountField.autoMatch(.width, to: .width, of: container)

        container.addArrangedSubview(periodField)
        periodField.autoMatch(.width, to: .width, of: container)

        container.addArrangedSubview(personalIdField)
        personalIdField.autoMatch(.width, to: .width, of: container)

        //let actionButton = UIButton(frame: .zero)
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.title = "Submit"
        buttonConfig.baseBackgroundColor = .purple

        let actionButton = UIButton(configuration: buttonConfig)
        actionButton.addTarget(self, action: #selector(didSubmit), for: .touchUpInside)

        container.addArrangedSubview(actionButton)
    }

    @objc private func didSubmit() {
        view.endEditing(true)

        presenter.didSubmit(amount: Int(amountField.textField.text ?? "") ?? 0,
                            period: Int(periodField.textField.text ?? "") ?? 0,
                            personalId: personalIdField.textField.text ?? "")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoanApplicationViewController: LoanApplicationPresenterOutput {
    func showLoading() {
        view.isUserInteractionEnabled = false
        view.addSubview(loadingIndicator)
        loadingIndicator.autoSetDimension(.width, toSize: 100)
        loadingIndicator.autoCenterInSuperview()
        loadingIndicator.startAnimating()
    }

    func hideLoading() {
        view.isUserInteractionEnabled = true
        loadingIndicator.removeFromSuperview()
        loadingIndicator.stopAnimating()
    }

    func showAmountError(with text: String) {
        amountField.showError(with: text)
    }

    func showPeriodError(with text: String) {
        periodField.showError(with: text)
    }

    func showPersonalIdError(with text: String) {
        personalIdField.showError(with: text)
    }
}
