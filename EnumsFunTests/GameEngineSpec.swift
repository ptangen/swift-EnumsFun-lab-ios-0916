//
//  GameEngineSpec.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

import Foundation
import XCTest
import Quick
import Nimble
@testable import EnumsFun

class GameEngineSpec: QuickSpec {
    override func spec() {
        describe("GameEngine") {
            var gameEngine = GameEngine(player1: "Player1", player2: "Player2")

            beforeEach {
                gameEngine = GameEngine(player1: "Player1", player2: "Player2")
            }

            describe("initializer") {
                it("creates players") {
                    expect(gameEngine.player1.name).to(equal("Player1"))
                    expect(gameEngine.player2.name).to(equal("Player2"))
                }
            }

            describe("playOneTurn") {
                it("returns the winner of the turn") {
                    let rank1 = Rank(rawValue: 10)!
                    let rank2 = Rank(rawValue: 8)!
                    let suit1 = Suit(rawValue: "♠️")!
                    let suit2 = Suit(rawValue: "♥️")!

                    let card1 = Card(suit: suit1, rank: rank1)
                    let card2 = Card(suit: suit2, rank: rank2)

                    let hand1 = Hand(cards: [card1])
                    let hand2 = Hand(cards: [card2])

                    gameEngine.player1.hand = hand1
                    gameEngine.player2.hand = hand2

                    let (winner, turnCard1, turnCard2) = gameEngine.playOneTurn()
                    expect(winner.name).to(equal("Player1"))
                    expect(turnCard1!.rank.rawValue).to(equal(10))
                    expect(turnCard2!.rank.rawValue).to(equal(8))
                }

                it("returns nil cards if a player has no cards") {
                    let rank2 = Rank(rawValue: 10)!
                    let suit2 = Suit(rawValue: "♠️")!

                    let card2 = Card(suit: suit2, rank: rank2)

                    let hand1 = Hand(cards: [])
                    let hand2 = Hand(cards: [card2])

                    gameEngine.player1.hand = hand1
                    gameEngine.player2.hand = hand2

                    let (winner, turnCard1, turnCard2) = gameEngine.playOneTurn()
                    expect(winner.name).to(equal("Player2"))
                    expect(turnCard1).to(beNil())
                    expect(turnCard2).to(beNil())
                }
            }

            describe("awardCards") {
                it("awards cards to a player") {
                    let rank1 = Rank(rawValue: 10)!
                    let suit1 = Suit(rawValue: "♠️")!
                    let card1 = Card(suit: suit1, rank: rank1)
                    gameEngine.award(cards: [card1], player: gameEngine.player1)
                    expect(gameEngine.player1.hand.size).to(equal(27))
                    expect(gameEngine.player2.hand.size).to(equal(26))
                }
            }

            describe("gameOver") {
                it("returns false if both players still have cards") {
                    expect(gameEngine.gameOver()).to(beFalse())
                }

                it("returns true if one or more players do not have cards") {
                    let hand = Hand(cards: [])
                    gameEngine.player2.hand = hand
                    expect(gameEngine.gameOver()).to(beTrue())
                }
            }
        }
    }
}
