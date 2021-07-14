//
//  TextAlignment.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct TextAlignment: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Multiline Text Alignment")
                .foregroundColor(.gray)
            Text("By default, text will be centered within the screen. But when it wraps to multiple lines, it will be leading aligned by default. Use multilineTextAlignment modifier to change this!")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(Color.white)

            Text(".multilineTextAlignment(.center)")
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.green)

            Text("Have I told you how awesome I think you are?")
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Text("You are SUPER awesome for improving your skills by using this book!")
                .multilineTextAlignment(.trailing) // Trailing align
                .padding(.horizontal)
        }
        // Apply this text style to all text views
        .font(.title)
    }
}

struct TextAlignment_Previews: PreviewProvider {
    static var previews: some View {
        TextAlignment()
    }
}
