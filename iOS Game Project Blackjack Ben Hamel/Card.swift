//
//  Card.swift
//  iOS Game Project Blackjack Ben Hamel
//
//  Created by Ben Hamel on 2022-03-06.
//

import Foundation

class Card{//1
    
//2
    let a: Int!
    let b: Int!
    private var result: Int?
    
//3
    init(a: Int,b: Int) {
        self.a = a
        self.b = b
    }
    
//4
    func add() {
        result = a + b
    }
    
//5
    func displayResult() {
        print("Result - \(result)")
    }
}
