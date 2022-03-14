//
//  LoanApplicationRouter.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

import Foundation
import UIKit

class LoanApplicationRouter: LoanApplicationRouting {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactory

    init(navigationController: UINavigationController,
         moduleFactory: ModuleFactory) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }

    func routeToDeclinedOffer() {
        let vc = moduleFactory.makeSorryOffer(with: navigationController).assemble()!
        navigationController.pushViewController(vc, animated: true)
    }

    func routeToLoanOffer(amount: Int, period: Int) {
        let vc = moduleFactory.makeLoanOffer(with: navigationController, amount: amount, period: period).assemble()!
        navigationController.pushViewController(vc, animated: true)
    }
}
