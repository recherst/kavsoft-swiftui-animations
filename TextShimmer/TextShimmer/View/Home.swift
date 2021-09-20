//
//  Home.swift
//  TextShimmer
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

struct Home: View {
    // Toggle for multiColors
    @State var multiColor = false
    var body: some View {
        VStack(spacing: 25) {
            TextShimmer(text: "Welcome", multiColors: $multiColor)

            TextShimmer(text: "Back", multiColors: $multiColor)

            TextShimmer(text: "Kavsoft", multiColors: $multiColor)

            Toggle(isOn: $multiColor, label: {
                Text("Enable Multi Colors")
                    .font(.title)
                    .fontWeight(.bold)
            })
            .padding()
        }
        .preferredColorScheme(.dark)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
