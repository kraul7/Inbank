//
//  LoanDataField.swift
//  InbankAssignment
//
//  Created by Raul Kuusik on 14.03.2022.
//

import UIKit
import PureLayout

class LoanDataField: UIView {
    private let titleLabel = UILabel()
    private let errorLabel = UILabel()
    let textField = UITextField()

    init(title: String) {
        super.init(frame: .zero)

        addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        titleLabel.text = title

        addSubview(textField)
        textField.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 4)
        textField.autoPinEdge(toSuperviewEdge: .left)
        textField.autoPinEdge(toSuperviewEdge: .right)

        textField.delegate = self
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 5
        textField.keyboardType = .numberPad

        addSubview(errorLabel)
        errorLabel.autoPinEdge(.top, to: .bottom, of: textField, withOffset: 4)
        errorLabel.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        errorLabel.textColor = .red
        errorLabel.numberOfLines = 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showError(with text: String) {
        errorLabel.text = text
    }
}

extension LoanDataField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)

        return allowedCharacters.isSuperset(of: characterSet)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorLabel.text = nil
    }
}

