//
//  DecisionService.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import Foundation

protocol DecisionService {
    func getMaximumLoanSum(application: LoanApplication, completion: @escaping (Result<LoanOffer, DecisionError>) -> Void)
}

class DummyDecisionService: DecisionService {
    private let decisionEngine: DecisionEngine

    init(decisionEngine: DecisionEngine) {
        self.decisionEngine = decisionEngine
    }

    func getMaximumLoanSum(application: LoanApplication, completion: @escaping (Result<LoanOffer, DecisionError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            completion(self.decisionEngine.getMaximumLoanSum(application: application))
        }
    }
}
