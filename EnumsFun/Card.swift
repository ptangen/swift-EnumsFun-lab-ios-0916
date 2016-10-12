//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case Spades = "♠️", Diamonds = "♦️", Hearts = "♥️", Clubs = "♣️"
    
    var indexValue: Int {
        switch self {
        case .Spades: return 0
        case .Diamonds: return 1
        case .Hearts: return 2
        case .Clubs: return 3
        }
    }
}

enum Rank: Int {

    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace

    var stringValue: String {
        switch self {
        case .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten : return String(self.rawValue)
        case .jack, .queen, .king: return "10"
        case .ace: return "11"
        }
    }
}



class Card {
    let suit: Suit
    let rank: Rank
    var description: String {
        return "\(self.rank)\(self.suit)"
    }
    
    init(suit: Suit, rank:Rank) {
        self.suit = suit
        self.rank = rank
    }
}
