//
//  FormViewModel.swift
//  FizzBuzz
//
//  Created by Julien Eyriès on 17/12/2020.
//

import UIKit

// view Model for the form
final class FormViewModel {
    
    var refresh: (() -> Void)?
    
    // public properties
    var int1String: String = ""
    var int2String: String = ""
    var limitString: String = ""
    var str1String: String = ""
    var str2String: String = ""
    var int1IsValid: Bool = true
    var int2IsValid: Bool = true
    var limitIsValid: Bool = true
    var str1IsValid: Bool = true
    var str2IsValid: Bool = true
    var isComputeEnabled: Bool = true
    var errorString: String? = nil
    
    // private properties
    private var int1: Int = 3
    private var int2: Int = 5
    private var limit: Int = 10_000_000
    private var str1: String = "fizz"
    private var str2: String = "buzz"
    
    init() {
        int1String = "\(int1)"
        int2String = "\(int2)"
        limitString = "\(limit)"
        str1String = "\(str1)"
        str2String = "\(str2)"
    }
    
}

// computed properties
extension FormViewModel {
    
    var fizzBuzz: FizzBuzz {
        return .init(int1: int1, int2: int2, limit: limit, str1: str1, str2: str2)
    }
}

// update
extension FormViewModel {
    
    func updateInt1(text: String?) {
        guard let text = text else { return }
        int1String = text
        validation()
    }
    
    func updateInt2(text: String?) {
        guard let text = text else { return }
        int2String = text
        validation()
    }
    
    func updateLimit(text: String?) {
        guard let text = text else { return }
        limitString = text
        validation()
    }
    
    func updateStr1(text: String?) {
        guard let text = text else { return }
        str1String = text
        validation()
    }
    
    func updateStr2(text: String?) {
        guard let text = text else { return }
        str2String = text
        validation()
    }
    
    func validation() {
        
        errorString = nil
        int1IsValid = true
        int2IsValid = true
        limitIsValid = true
        str1IsValid = true
        str2IsValid = true
        
        if let number = Int(int1String) {
            if number >= 1 {
                int1 = number
            } else  {
                int1IsValid = false
                errorString = "please enter an integer greater than 1"
            }
        } else {
            int1IsValid = false
            errorString = "please enter an integer"
        }
        
        if let number = Int(int2String) {
            if number >= 1 {
                int2 = number
            } else  {
                int2IsValid = false
                errorString = "please enter an integer greater than 1"
            }
        } else {
            int2IsValid = false
            errorString = "please enter an integer"
        }
        
        if let number = Int(limitString) {
            if number >= 1 /*&& number <= 100000*/ {
                limit = number
            } else  {
                limitIsValid = false
                errorString = "please enter an integer greater than 1"
            }
        } else {
            limitIsValid = false
            errorString = "please enter an integer"
        }
        
        if !str1String.isEmpty {
            str1 = str1String
        } else {
            str1IsValid = false
            errorString = "please enter some text"
        }
        
        if !str2String.isEmpty {
            str2 = str2String
        } else {
            str2IsValid = false
            errorString = "please enter some text"
        }
        
        isComputeEnabled = int1IsValid && int2IsValid && limitIsValid && str1IsValid && str2IsValid
        refresh?()
    }
    
}

