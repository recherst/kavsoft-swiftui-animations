//
//  Layout1.swift
//  CompositionalLayout
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI
import SDWebImageSwiftUI

var width = UIScreen.main.bounds.width - 30

struct Layout1: View {
    var cards: [Card]
    var body: some View {
        HStack(spacing: 4) {
            AnimatedImage(url: URL(string: cards[0].downloadUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: (width - (width / 3) + 4), height: 250)
                .cornerRadius(4)
                .modifier(ContextModifier(card: cards[0]))

            VStack(spacing: 4) {
                // 123 + 123 + 4 = 250
                if cards.count >= 2 {
                    AnimatedImage(url: URL(string: cards[1].downloadUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (width / 3), height: 123)
                        .cornerRadius(4)
                        .modifier(ContextModifier(card: cards[1]))
                }

                if cards.count == 3 {
                    AnimatedImage(url: URL(string: cards[2].downloadUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (width / 3), height: 123)
                        .cornerRadius(4)
                        .modifier(ContextModifier(card: cards[2]))
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Layout1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
