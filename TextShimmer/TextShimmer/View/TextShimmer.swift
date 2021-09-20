//
//  TextShimmer.swift
//  TextShimmer
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

struct TextShimmer: View {
    var text: String
    @State var animation = false
    @Binding var multiColors: Bool

    var body: some View {
        ZStack {
            Text(text)
                .font(.system(size: 75, weight: .bold))
                .foregroundColor(Color.white.opacity(0.25))

            // MultiColor text
            HStack(spacing: 0) {
                ForEach(0..<text.count, id: \.self) { index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 75, weight: .bold))
                        .foregroundColor(multiColors ? .random : .white)
                }
            }
            // Mask for shimmer effect
            .mask(
                Rectangle()
                    // For some more nice effect, we're going to use gradient
                    .fill(
                        LinearGradient(
                            gradient: .init(colors: [Color.white.opacity(0.5), Color.white, Color.white.opacity(0.5)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                    .offset(x: -250)
                    // Move view continously, so it will create shimmer effect
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear(perform: {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    animation.toggle()
                }
            })
        }
    }
}

struct TextShimmer_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension Color {

    static var random: Color {
        let color = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
        return Color(color)
    }
}
