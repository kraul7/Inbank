//
//  AppModule.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit

protocol AppModule {
    func assemble() -> UIViewController?
}

protocol ModuleFactory {
    
}

struct ModuleFactoryImpl: ModuleFactory {
    let loanConstraints = LoanConstraints(minAmount: 2000, maxAmount: 10000, minPeriod: 12, maxPeriod: 60, step: 100)
}
