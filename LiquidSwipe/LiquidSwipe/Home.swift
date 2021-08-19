//
//  Home.swift
//  LiquidSwipe
//
//  Created by recherst on 2021/8/19.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Color("bg")
                .clipShape(LiquidSwipe())
                .ignoresSafeArea()
                // arrow
                .overlay(
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        .offset(y: 65)

                    , alignment: .topTrailing
                )
                .padding(.trailing)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Custom Shape
struct LiquidSwipe: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            // First constructing rectangle shape
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            // Now constructing curve shape
            path.move(to: CGPoint(x: width, y: 80))
            // Mid between 80 - 180
            let mid: CGFloat = 80 + ((180 - 80) / 2)
            path.addCurve(to: CGPoint(x: width, y: 180), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
        }
    }
}
