//
//  StatisticsService.swift
//  FizzBuzz
//
//  Created by Julien Eyriès on 17/12/2020.
//

import Foundation

/*
 - This service allow to know what the most frequent request has been
  as well as the number of hits for this form.
  
 */

protocol StatisticsServiceProtocol {
    func addRequest(fizzBuzz: FizzBuzz)
    func mostFrequentRequest() -> (FizzBuzz, Int)?
}

final class StatisticsService: StatisticsServiceProtocol {
    
    private var histo: [FizzBuzz: Int] = .init()
    
    func addRequest(fizzBuzz: FizzBuzz) {
        let count = histo[fizzBuzz] ?? 0
        histo[fizzBuzz] = count + 1
    }
    
    func mostFrequentRequest() -> (FizzBuzz, Int)? {
        let maximum = histo.max { $0.value < $1.value }
        guard let result = maximum else { return nil }
        return (result.key, result.value)
    }
    
    
}
