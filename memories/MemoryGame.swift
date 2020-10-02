//
//  MemoryGame.swift
//  memories
//
//  Created by liwei43 on 2020/10/1.
//  Copyright © 2020 xyz. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card choosen: \(card)")
        let index:Int = self.index(of: card)
        self.cards[index].isFaceUP = !self.cards[index].isFaceUP
    }
    
    func index(of card:Card) -> Int {
        for index in 0..<cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
//        print(Unmanaged<AnyObject>.passUnretained(cards as AnyObject).toOpaque())

        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUP: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
