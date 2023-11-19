//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Vineeth Kanaparthi on 11/18/23.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    init(numberOFPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        // add number of pairs of cards * 2 cards
        for pairIndex in 0..<max(2,numberOFPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
