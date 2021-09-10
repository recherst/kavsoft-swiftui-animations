//
//  Home.swift
//  ParallaxCarousel
//
//  Created by recherst on 2021/9/10.
//

import SwiftUI

struct Home: View {
    @State var selected: Int = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var body: some View {
        TabView(selection: $selected) {
            // Images
            ForEach(1...7, id: \.self) { index in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                    // Geometry reader for parallax effect
                    GeometryReader { reader in
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // Moving view in opposite side
                            // When user starts to swipe
                            // This will create parallax effect
                            .offset(x: -reader.frame(in: .global).minX)
                            .frame(width: width, height: height / 2)
                    }
                    .frame(height: height / 2)
                    .cornerRadius(15)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    // Shadow
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                    // Decreasing width by padding
                    // So outer view only decreased
                    // Inner image will be full width

                    // Bottom image
                    Image("pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .padding(5)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: -15, y: 25)
                })
                .padding(.horizontal, 25)

            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
