//
//  ContentView.swift
//  Memorize
//
//  Created by Vineeth Kanaparthi on 11/17/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    var emojiMemoryGame: EmojiMemoryGame
    
    let emojis = ["👻", "🎃", "🕷️", "😈", "👻", "🎃", "🕷️", "😈", "👻", "🎃", "🕷️", "😈"]
    
    var body: some View {
        ScrollView{
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base =  RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1: 0)
            
            base.opacity(isFaceUp ? 0: 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}


























#Preview {
    EmojiMemoryGameView()
}
