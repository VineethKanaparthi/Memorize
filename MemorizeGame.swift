//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Vineeth Kanaparthi on 11/18/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
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
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            "\(id) : \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "Matched": "Unmatched")"
        }
        
        let id = UUID()
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
