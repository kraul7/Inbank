//
//  LoanOfferRouter.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation
import UIKit

class LoanOfferRouter: LoanOfferRouting {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactory

    init(navigationController: UINavigationController,
         moduleFactory: ModuleFactory) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
}
