//
//  ColorOpacity.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct ColorOpacity: View {
    var body: some View {
        ZStack {
            Color.purple

            VStack(spacing: 20) {
                Text("Color")
                    .font(.largeTitle)
                Text("Opacity")
                    .font(.title)
                    .colorInvert()
                Text("There are a couple ways to adjust color opacity. You can use the Inspector and create a custom color to adjust the opacity there. This black background's opacity is at 25%.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        // here's the color definition that is created.
                        Color(hue: 0.79, saturation: 0.0, brightness: 0.0, opacity: 0.25)
                    )
                    .font(.title)
                    .layoutPriority(1)
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

// To set the opacity you can go into the Inspector and select "Custom"
// for a color. (You might have to select it twice for the color picker to show.)
// You can use the slider to adjust the opacity or manually enter a value.
// Although, here it is referred to as "Alpha", not opacity, the effect is the
// same.
struct ColorOpacity_Previews: PreviewProvider {
    static var previews: some View {
        ColorOpacity()
    }
}
