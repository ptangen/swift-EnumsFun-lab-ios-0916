//
//  PlayerSpec.swift
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

class PlayerSpec: QuickSpec {
    override func spec() {
        describe("Player") {
            let rank1 = Rank(rawValue: 10)!
            let rank2 = Rank(rawValue: 11)!
            let suit1 = Suit(rawValue: "♥️")!
            let suit2 = Suit(rawValue: "♠️")!

            let card1 = Card(suit: suit1, rank: rank1)
            let card2 = Card(suit: suit2, rank: rank2)

            var hand = Hand(cards: [card1, card2])
            var player = Player(name: "Player", hand: hand)

            beforeEach {
                hand = Hand(cards: [card1, card2])
                player = Player(name: "Player", hand: hand)
            }

            describe("initializer") {
                it("sets the name property") {
                    expect(player.name).to(equal("Player"))
                }
            }

            describe("name") {
                it("returns the name of the player") {
                    expect(player.name).to(equal("Player"))
                }
            }

            describe("hasCards") {
                it("returns true if the player has cards in their hand") {
                    expect(player.hasCards()).to(beTrue())
                }

                it("returns false if the player does not have cards in their hand") {
                    let hand = Hand(cards: [])
                    player = Player(name: "Player", hand: hand)
                    expect(player.hasCards()).to(beFalse())
                }
            }

            describe("flipCard") {
                it("returns a card if the player has cards in their hand") {
                    let card = player.flip()
                    expect(card).to(beTruthy())
                }

                it("returns nil if the player does not have cards in their hand") {
                    let hand = Hand(cards: [])
                    player = Player(name: "Player", hand: hand)
                    let card = player.flip()
                    expect(card).to(beNil())
                }
            }

            describe("giveCard") {
                it("adds a card to a player's hand") {
                    player.give(card: card1)
                    expect(player.hand.size).to(equal(3))
                }
            }

            describe("loseCard") {
                it("takes a card from a player's hand") {
                    player.lose(card: card1)
                    expect(player.hand.size).to(equal(1))
                }
            }
        }
    }
}
