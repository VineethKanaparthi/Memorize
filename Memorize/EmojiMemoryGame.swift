//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Vineeth Kanaparthi on 11/18/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "👻", "🎃", "🕷️", "😈", "👻", "🎃", "🕷️", "😈"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOFPairsOfCards: 16){ pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }else{
                return "⁉️"
            }
            
        }
    }
    
    @Published private var game = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return game.cards
    }
    
    
    // MARK: - Intents
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        game.choose(card)
    }
}
