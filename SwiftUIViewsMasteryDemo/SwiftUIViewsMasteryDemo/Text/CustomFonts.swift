//
//  CustomFonts.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct CustomFonts: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Custom Fonts")
                .foregroundColor(.gray)
            Text("Use a font that already exists on the system. If the font name doesn't exist, it goes back  to the default font.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.green)
                .foregroundColor(.white)

            Text("This font doesn't exist")
                .font(Font.custom("No such Font", size: 26))

            Group {
                Text("Existing fonts:")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title)
                    .background(Color.green)
                    .foregroundColor(.white)
                Text("Avenir Next")
                    .font(Font.custom("Avenir Next", size: 26))
                Text("Gill Sans")
                    .font(Font.custom("Gill Sans", size: 26))
                Text("Helvetica Neue")
                    .font(Font.custom("Helvetica Neue", size: 26))
            }

            Group {
                Text("Adjust the Weight:")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title)
                    .background(Color.green)
                    .foregroundColor(.white)

                Text("Avenir Next")
                    .font(Font.custom("Avenir Next Regular", size: 26))
            }

            Group {
                Text("Or change with the weight modifier:")
                    .foregroundColor(.red)
                Text("Avenir Next Regular Weight")
                    .font(Font.custom("Avenir Next", size: 26).weight(.regular))
            }
        }
    }
}

struct CustomFonts_Previews: PreviewProvider {
    static var previews: some View {
        CustomFonts()
    }
}
