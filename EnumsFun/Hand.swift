//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card]
    var size:Int { return cards.count }
    var cardToReturn: Card?
    
    init(cards:[Card]) {
        self.cards = cards
    }
    
    
    func flip() -> Card? {
        if cards.count > 0 {
            cardToReturn = cards[0]
            
            return cardToReturn
        }
        return nil
    }
    
    func give(card: Card) {
        cards.append(card)
    }
    
    func lose(card:Card) {
        // remove the card passed from the hand
        for currentCard in cards {
            if currentCard.description == card.description {
                cards.remove(at: 0)
                break
            }
        }
    }
    
}
