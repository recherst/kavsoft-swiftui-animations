//
//  LineSpacing.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct LineSpacing: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Text")
                .font(.largeTitle)
            Text("Line Spacing")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can use line spacing to add more space between lines of text. This text has no  line spacing applied:")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.green)
                .foregroundColor(.white)
            Text("SwiftUI offers a Line Spacing modifier for situations where you want to increase the space between the lines of text on the screen.")
                .font(.title)

            Text("With Line Spacing of 16:")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)

            Text("SwiftUI offers a Line Spacing modifier for situations where you want to increase the space between the lines of text on the screen.")
                // add spacing between lines
                .lineSpacing(16)
                .font(.title)

        }
    }
}

struct LineSpacing_Previews: PreviewProvider {
    static var previews: some View {
        LineSpacing()
    }
}
