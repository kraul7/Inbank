//
//  UIStackview+extensions.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit

extension UIStackView {
    func configured(
        axis: NSLayoutConstraint.Axis? = nil,
        alignment: UIStackView.Alignment? = nil,
        distribution: UIStackView.Distribution? = nil,
        spacing: CGFloat? = nil
        ) -> Self {
        axis.map { self.axis = $0 }
        alignment.map { self.alignment = $0 }
        distribution.map { self.distribution = $0 }
        spacing.map { self.spacing = $0 }
        return self
    }
}
