//
//  SystemColor.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct SystemColor: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color")
                .font(.largeTitle)
            Text("Other System Colors")
                .font(.title)
                .foregroundColor(.gray)

            Text("These colors show differently depending on light or dark mode.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.blue)
                .foregroundColor(.white)

            Text("Light Mode")
                .font(.title)
            Text("Primary Color")
                .foregroundColor(Color.primary)
            Text("Secondary Color")
                .foregroundColor(Color.secondary)
            Text("Accent Color")
                .foregroundColor(Color.accentColor)

            Group {
                Text("Dark Mode")
                    .font(.title)
                Text("Primary Color")
                    .foregroundColor(Color.primary)
                Text("Secondary Color")
                    .foregroundColor(Color.secondary)
                Text("Accent Color")
                    .foregroundColor(Color.accentColor)
            }
        }
    }
}

struct SystemColor_Previews: PreviewProvider {
    static var previews: some View {
        SystemColor()
    }
}
