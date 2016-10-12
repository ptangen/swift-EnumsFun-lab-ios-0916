//
//  HandSpec.swift
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

class HandSpec: QuickSpec {
    override func spec() {
        describe("Hand") {
            let rank1 = Rank(rawValue: 10)!
            let rank2 = Rank(rawValue: 11)!
            let suit1 = Suit(rawValue: "♥️")!
            let suit2 = Suit(rawValue: "♠️")!

            let card1 = Card(suit: suit1, rank: rank1)
            let card2 = Card(suit: suit2, rank: rank2)

            var hand = Hand(cards: [card1, card2])

            beforeEach {
                hand = Hand(cards: [card1, card2])
            }

            describe("initializer") {
                it("adds all cards to the hand") {
                    expect(hand.cards.count).to(equal(2))
                }
            }

            describe("flip") {
                it("returns a card if one exists in the hand") {
                    let card = hand.flip() != nil
                    expect(card).to(beTruthy())
                }

                it("returns nil if the hand is empty") {
                    let card1 = hand.flip() != nil
                    let card2 = hand.flip() != nil
                    let card3 = hand.flip()
                    expect(card1).to(beTruthy())
                    expect(card2).to(beTruthy())
                    expect(card3).to(beNil())
                }

                it("removes cards from the hand") {
                    var _ = hand.flip()
                    expect(hand.cards.count).to(equal(1))
                    _ = hand.flip()
                    expect(hand.cards.count).to(equal(0))
                    _ = hand.flip()
                    expect(hand.cards.count).to(equal(0))
                }
            }

            describe("size") {
                it("returns the size of the hand") {
                    expect(hand.size).to(equal(2))
                    var _ = hand.flip()
                    expect(hand.size).to(equal(1))
                    _ = hand.flip()
                    expect(hand.size).to(equal(0))
                }
            }

            describe("giveCard") {
                it("adds a card to the hand") {
                    expect(hand.size).to(equal(2))
                    hand.give(card: card1)
                    expect(hand.size).to(equal(3))
                }
            }

            describe("loseCard") {
                it("takes a card from the hand") {
                    expect(hand.size).to(equal(2))
                    hand.lose(card: card1)
                    expect(hand.size).to(equal(1))
                }
            }
        }
    }
}
