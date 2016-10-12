//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    var player1: Player
    var player2: Player
    var deck: Deck
    
    init(player1: String, player2: String){
        self.deck = Deck()
        let splitDeck = deck.split()
        var hand1 = Hand(cards: splitDeck.0)
        var hand2 = Hand(cards: splitDeck.1)
        self.player1 = Player(name: player1, hand: hand1)
        self.player2 = Player(name: player2, hand: hand2)
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        if let player1Card = player1.flip() {
            if let player2Card = player2.flip() {
                let winner: Player
                
                if player1Card.rank.rawValue > player2Card.rank.rawValue {
                    winner = player1
                } else {
                    winner = player2
                }
                return (winner, player1Card, player2Card)
            }
        }
        return (player1, Card(suit: .Clubs, rank: .ace),Card(suit: .Clubs, rank: .ace)) // not used
    }
    
    func award(cards: [Card], player: Player){
        // It should give the player all of the cards.
        if player.name == player1.name {
            for card in cards {
                player1.give(card: card)
                player2.lose(card: card)
            }
        } else {
            for card in cards {
                player2.give(card: card)
                player1.lose(card: card)
            }
        }
    }
    
    func gameOver() -> Bool {
        if deck.cards.count == 0 {
            return true
        }
        return false
    }
}
