//
//  ColorLightAndDarkModes.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct ColorLightAndDarkModes: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color")
                .font(.largeTitle)
            Text("In Light and Dark Modes")
                .foregroundColor(.gray)
            Text("The system colors will actually change in light and dark mode to provide optional constrast. If you supply a named color, you should try to adopt this practice.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .layoutPriority(1)

            List {
                Color.pink
                Color.red
                Color.purple
                Color.blue
                Color.green
                Color.yellow
                Color.orange
                Text("Custom Colors")
                Color("AccentColorDark")
                Color("AccentColorLight")
            }
        }
    }
}

struct ColorLightAndDarkModes_Previews: PreviewProvider {
    static var previews: some View {
        ColorLightAndDarkModes()
    }
}
