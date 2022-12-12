//
//  Concentration Game.swift
//  Concentration
//
//  Created by Vagan Galstian on 16.11.2022.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    var indexOfOneOnlyUpCard: Int?
    
    func choseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneOnlyUpCard, matchingIndex != index {
                if cards[index].id == cards[matchingIndex].id {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneOnlyUpCard = nil
            } else {
                for eachCard in cards.indices {
                    cards[eachCard].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneOnlyUpCard = index
            }
        }
    }
    
    init(numberOfPairsCards: Int){
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards += [card, card]
            cards = cards.shuffled()
        }
    }
}
