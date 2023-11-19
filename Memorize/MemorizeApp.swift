//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Vineeth Kanaparthi on 11/17/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(emojiMemoryGame: game)
        }
    }
}
