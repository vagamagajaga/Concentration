//
//  Card.swift
//  Concentration
//
//  Created by Vagan Galstian on 10.12.2022.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    static var identifierNumber = 0
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.id = Card.identifierGenerator()
    }
    
}
