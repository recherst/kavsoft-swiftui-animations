//
//  Home.swift
//  VerticalPageTabView
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

struct Home: View {
    // Page tab bar has a bug that i bounces
    // But we have solution for it
    // But is disables all scroll bounces in whole app
    // Hope SwiftUI 3.0 will solve this
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        // Page tab view again has a bug that doesn't ignore top edge
        // But we have solution for that
        ScrollView(.init()) {
            GeometryReader { reader in
                let screen = reader.frame(in: .global)

                TabView {
                    ForEach(1...5, id: \.self) { index in
                        Image("img\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(1)
                            // Before rotation frame
                            .frame(width: screen.width, height: screen.height)
                            // Rerotate views to -90 so that it will act as vertical carousel
                            .rotationEffect(.init(degrees: -90))
                            // After rotation frame
                            .frame(width: screen.height, height: screen.width)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                // Vertical tab bar
                .rotationEffect(.init(degrees: 90))
                // Adjust width
                .frame(width: screen.width)
            }
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension View {
    var rect: CGRect {
        UIScreen.main.bounds
    }
}
