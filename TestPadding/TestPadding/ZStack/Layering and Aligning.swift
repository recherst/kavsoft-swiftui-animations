//
//  Layering and Aligning.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/6.
//

import SwiftUI

struct Layering_and_Aligning: View {
    var body: some View {
        VStack {
            Text("ZStack")
                .font(.largeTitle)

            Text("Layering & Aligning")
                .font(.title)
                .foregroundColor(.gray)

            Text("ZStacks are great for layering views. For example, putting text on top of an image. You can align all the subviews within the ZStack.")
                // Force the height. Can increase but not go below 171.
                .frame(maxWidth: .infinity, minHeight: 171)
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .font(.title)

            ZStack(alignment: .bottomTrailing) {
                Image("Yosemite_large")

                Rectangle()
                    .foregroundColor(.white.opacity(0.7))
                    .frame(width: 390, height: 50)

                Text("Yosemite National Park")
                    .font(.title)
                    // Override the default padding with 8 points
                    .padding(8)
            }

            Text("View Hierarchy")
                .font(.title)
                .foregroundColor(.gray)

        }
        .font(.title)
    }
}

struct Layering_and_Aligning_Previews: PreviewProvider {
    static var previews: some View {
        Layering_and_Aligning()
    }
}
