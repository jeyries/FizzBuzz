//
//  FormComponent.swift
//  FizzBuzz
//
//  Created by Julien Eyriès on 17/12/2020.
//

import UIKit

// A simple component with a label and a text fields inside a stack view

final class FormComponent {
    
    let name: String
    let value: String
    let isNumber: Bool
    let didChange: (String?) -> Void
    
    init(name: String, value: String, isNumber: Bool, didChange: @escaping (String?) -> Void) {
        self.name = name
        self.value = value
        self.isNumber = isNumber
        self.didChange = didChange
    }
    
    func update(isValid: Bool) {
        label.textColor = isValid ? .black : .red
        textField.textColor = isValid ? .black : .red
    }
    
    lazy var rootView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = UIStackView.spacingUseSystem
        view.addArrangedSubview(label)
        view.addArrangedSubview(textField)
        label.widthAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(name) = "
        label.textAlignment = .left
        //label.backgroundColor = .green
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = value
        textField.textAlignment = .left
        //textField.backgroundColor = .gray
        textField.keyboardType = isNumber ? .numberPad : .default
        textField.placeholder = isNumber ? "integer" : "string"
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    @objc private func textFieldDidChange() {
        didChange(textField.text)
    }
    
}
