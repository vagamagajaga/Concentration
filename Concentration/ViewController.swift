//
//  ViewController.swift
//  Concentration
//
//  Created by Vagan Galstian on 16.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numberOfPairsCards: (buttonCollection.count + 1) / 2)
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    var emojiCollection = ["🐥", "🐯", "🐝", "🦆", "🐌", "🐒", "🪲", "🐗", "🪱", "🦖", "🦄"]
    var emojiDictionary = [Int: String]()
                           
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.id] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.id] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.id] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .white : .systemBlue
            }
        }
    }
    
    @IBOutlet weak var touchLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.choseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
}

