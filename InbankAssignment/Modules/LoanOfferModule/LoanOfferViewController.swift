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
    private let label = UILabel()

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        title = "Offer"

        label.alpha = 0
        view.addSubview(label)
        label.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        label.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        label.autoAlignAxis(toSuperviewAxis: .horizontal)
        label.numberOfLines = 0
        label.textAlignment = .center
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
        label.text = "sorry, not lending you anything :/"
        label.transform = CGAffineTransform(scaleX: 0, y: 0)

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 1, animations: { [weak self] in
            self?.label.alpha = 1
            self?.label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: { [weak self] _ in
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.label.transform = .identity
            })
        })
    }

    func showOffer(amount: Int, period: Int) {
        label.text = String.init(format: "You can get up to %d € for period of %d months", amount, period)
        label.transform = CGAffineTransform.init(rotationAngle: 90)

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 1, animations: { [weak self] in
            self?.label.alpha = 1
            self?.label.transform = .identity
        })
    }
}
