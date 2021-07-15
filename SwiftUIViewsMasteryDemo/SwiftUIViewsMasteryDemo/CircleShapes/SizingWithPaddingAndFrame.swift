//
//  SizingWithPaddingAndFrame.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct SizingWithPaddingAndFrame: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Circular Shapes")
                .font(.largeTitle)
            Text("Sizing")
                .foregroundColor(.gray)
            Text("Shapes are push-out views. Use modifiers, such as padding or frame, to size them as you see fit.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)

            Text("Using padding")

            ZStack {
                Circle()
                    .fill(Color.red)
                    .padding()
                Circle()
                    .fill(Color.white)
                    .padding(40)
                Circle()
                    .fill(Color.red)
                    .padding(60)
                Circle()
                    .fill(Color.white)
                    .padding(80)
            }
            .frame(width: 200, height: 200)

            Text("Using frames")

            ZStack(alignment: .bottom) {
                Circle()
                    .fill(Color.secondary)
                    .frame(height: 250)
                Circle()
                    .fill(Color.secondary)
                    .frame(height: 200)
                Circle()
                    .fill(Color.secondary)
                    .frame(height: 150)
                Circle()
                    .fill(Color.secondary)
                    .frame(height: 100)
            }
        }
        .font(.title)
    }

    // Note, using multiple secondary colors on top of each other (using frames example)
    // will lighten or darken each one depending on if your app is in dark mode or light
    // mode.
}

struct SizingWithPaddingAndFrame_Previews: PreviewProvider {
    static var previews: some View {
        SizingWithPaddingAndFrame()
    }
}
