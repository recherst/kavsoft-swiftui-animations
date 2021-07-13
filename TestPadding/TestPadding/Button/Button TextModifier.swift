//
//  Button TextModifier.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/9.
//

import SwiftUI

struct Button_TextModifier: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("Text Composition")
                .foregroundColor(.gray)
            Text("You can add more than one text view to a button. By Default, the views are composed within an HStack.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)
                .font(.title)

            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                // Views arranged horizontally be default.
                Text("Forget Password?")
                Text("Tap to Recover")
                    .foregroundColor(.orange)
            })

            Text("Using a VStack")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)

            Button(action: {}, label: {
                VStack {
                    Text("New User")
                    Text("(Register Here)")
                        .font(.body)
                }
            })
        }
        .font(.title)
    }
}

struct Button_TextModifier_Previews: PreviewProvider {
    static var previews: some View {
        Button_TextModifier()
    }
}
