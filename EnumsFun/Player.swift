//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    let name: String
    var hand: Hand
    
    init(name: String, hand: Hand) {
        self.name = name
        self.hand = hand
    }
    
    func hasCards() -> Bool {
        if hand.cards.count > 0 { return true }; return false
    }
    
    func flip() -> Card? {
        return self.hand.flip()
    }
    
    func give(card: Card) {
        self.hand.cards.append(card)
    }
    
    func lose(card:Card) {
        // remove the card passed from the hand
        for currentCard in self.hand.cards {
            if currentCard.description == card.description {
                self.hand.cards.remove(at: 0)
                break
            }
        }
    }
}
