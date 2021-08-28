//
//  FooterView.swift
//  MediumStickyFooterAnimation
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI

struct FooterView: View {
    // Dark mode
    @State var darkMode = false
    @State var offset: CGFloat = 0

    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "hands.clap.fill")
                    .font(.title2)
                    .foregroundColor(.primary)
            })
            .frame(maxWidth: .infinity)

            Group {
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                .frame(maxWidth: .infinity)
                // Reduce distance while scrolling
                .offset(x: offset == 0 ? 0 : 50 * (offset / 120))

                Button(action: {}, label: {
                    Image(systemName: "bookmark")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                .frame(maxWidth: .infinity)

                Button(action: {
                    withAnimation { darkMode.toggle() }
                }, label: {
                    Image(systemName: darkMode ? "sun.min.fill" : "moon")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                .frame(maxWidth: .infinity)
            }
            .offset(x: offset)
        }
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 15)
        .padding(.top)
        // Maxheight
        .frame(maxHeight: 80)
        .background(darkMode ? Color.black : Color.white)
        .preferredColorScheme(darkMode ? .dark : .light)
        .overlay(
            // geometry reader for get maxY and animation
            GeometryReader { reader -> Color in
                let maxY = reader.frame(in: .global).maxY
                let maxheight = UIScreen.main.bounds.height

                DispatchQueue.main.async {
                    if maxY < maxheight {
                        if offset <= 120 {
                            // Smoothly moving the offset to 120

                            // up to -100 top scroll
                            // It's your wish to animate
                            let progress = (maxheight - maxY) / 100
                            self.offset = progress * 120 <= 120 ? progress * 120 : 120
                        }
                    }
                }
                return Color.clear
            }
            , alignment: .bottom
        )

    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
