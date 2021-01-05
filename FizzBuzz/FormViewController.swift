//
//  FormViewController.swift
//  FizzBuzz
//
//  Created by Julien Eyriès on 17/12/2020.
//

import UIKit

/*
 - Have a form that accepts five parameters : three integers int1, int2 and limit, and two strings str1 and str2.
 */

final class FormViewController: UIViewController {
    
    enum Action {
        case compute(FizzBuzz)
    }

    var callback: ((Action) -> Void)?
    
    private var model: FormViewModel = .init()
    
    override func loadView() {
        title = "FizzBuzz"
        view = rootView
        model.refresh = { [weak self] in self?.refresh() }
    }
    
    private func refresh() {
        errorLabel.text = model.errorString
        computeButton.isEnabled = model.isComputeEnabled
        int1Input.update(isValid: model.int1IsValid)
        int2Input.update(isValid: model.int2IsValid)
        limitInput.update(isValid: model.limitIsValid)
        str1Input.update(isValid: model.str1IsValid)
        str2Input.update(isValid: model.str2IsValid)
    }
    
    private lazy var rootView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = UIStackView.spacingUseSystem
        view.addArrangedSubview(infoLabel)
        view.addArrangedSubview(int1Input.rootView)
        view.addArrangedSubview(int2Input.rootView)
        view.addArrangedSubview(limitInput.rootView)
        view.addArrangedSubview(str1Input.rootView)
        view.addArrangedSubview(str2Input.rootView)
        view.addArrangedSubview(computeButton)
        view.addArrangedSubview(errorLabel)
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter parameters :"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var int1Input: FormComponent = {
        return FormComponent(name: "int1", value: model.int1String, isNumber: true, didChange: model.updateInt1 )
    }()
    
    private lazy var int2Input: FormComponent = {
        return FormComponent(name: "int2", value: model.int2String, isNumber: true, didChange: model.updateInt2 )
    }()
    
    private lazy var limitInput: FormComponent = {
        return FormComponent(name: "limit", value: model.limitString, isNumber: true, didChange: model.updateLimit )
    }()
    
    private lazy var str1Input: FormComponent = {
        return FormComponent(name: "str1", value: model.str1String, isNumber: false, didChange: model.updateStr1 )
    }()
    
    private lazy var str2Input: FormComponent = {
        return FormComponent(name: "str2", value: model.str2String, isNumber: false, didChange: model.updateStr2 )
    }()
    
    private lazy var computeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Compute !", for: .normal)
        button.addTarget(self, action: #selector(computeAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func computeAction() {
        dismissKeyboard()
        callback?(.compute(model.fizzBuzz))
    }
    
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = model.errorString
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()

}

