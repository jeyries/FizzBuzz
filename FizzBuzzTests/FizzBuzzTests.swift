//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by Julien Eyriès on 17/12/2020.
//

import XCTest
@testable import FizzBuzz

class FizzBuzzTests: XCTestCase {

    /*
     The original fizz-buzz consists in writing all numbers from 1 to 100, and just replacing all multiples of 3 by "fizz", all multiples of 5 by "buzz", and all multiples of 15 by "fizzbuzz". The output would look like this: "1,2,fizz,4,buzz,fizz,7,8,fizz,buzz,11,fizz,13,14,fizzbuzz,16,...".
     */
    
    func testSimple() throws {
        let fizzBuzz = FizzBuzz(int1: 3, int2: 5, limit: 16, str1: "fizz", str2: "buzz")
        let generated = (1 ... 16).map(fizzBuzz.compute)
        let expected = ["1","2","fizz","4","buzz","fizz","7","8","fizz","buzz","11","fizz","13","14","fizzbuzz","16"]
        XCTAssertEqual(generated, expected)
    }

}
