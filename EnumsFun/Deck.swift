//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card] = [Card]()
    
    init(){
        // generate the deck of cards
        let suitsArr = [Suit.Spades,Suit.Hearts,Suit.Diamonds,Suit.Clubs]
        for suitMember in suitsArr {
            for index in 2...14 {
                if let rank = Rank(rawValue: index) {
                    cards.append(Card(suit: suitMember, rank: rank))
                }
            }
        }
        cards.shuffle()
    }
    
    func split() -> ([Card], [Card]){
        // split the set of the cards in half and return a two-element tuple consisting of each half of the deck
        var twoHands = cards.split()
        return twoHands
    }
}
