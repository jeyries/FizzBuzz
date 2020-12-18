//
//  FizzBuzz.swift
//  FizzBuzz
//
//  Created by Julien Eyriès on 17/12/2020.
//

import Foundation

/*
 A simple fizz-buzz model.
 */

struct FizzBuzz: Hashable {
    let int1: Int
    let int2: Int
    let limit: Int
    let str1: String
    let str2: String
}


extension FizzBuzz {
    func compute(at index: Int) -> String {
        let isMultipleOfInt1 = index % int1 == 0
        let isMultipleOfInt2 = index % int2 == 0
        if isMultipleOfInt1 && isMultipleOfInt2 {
            return str1 + str2
        } else if isMultipleOfInt1 {
            return str1
        } else if isMultipleOfInt2 {
            return str2
        } else {
            return String(index)
        }

    }
}
