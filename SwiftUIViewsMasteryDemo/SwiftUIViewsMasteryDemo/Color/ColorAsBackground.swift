//
//  ColorAsBackground.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct ColorAsBackground: View {
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .edgesIgnoringSafeArea(.vertical)

            // you main view content here
            VStack(spacing: 20) {
                Text("Color")
                    .font(.largeTitle)
                Text("Using As Background")
                    .font(.title)
                    .foregroundColor(.gray)
                Divider()
                Text("With a ZStack, you can set a Color view as the background color.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .layoutPriority(1)

                Text("(Background in Dark Mode)")
                    .padding(.top, 150)
            }
        }
        .font(.title)
    }
}

struct ColorAsBackground_Previews: PreviewProvider {
    static var previews: some View {
        ColorAsBackground()
            .preferredColorScheme(.dark)
    }
}
