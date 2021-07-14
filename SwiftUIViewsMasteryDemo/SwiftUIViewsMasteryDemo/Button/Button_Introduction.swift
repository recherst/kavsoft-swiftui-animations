//
//  Button_Introduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/9.
//

import SwiftUI

struct Button_Introduction: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            Text("If you just want to show the default text style in a button then you can pass in a string as the first parameter.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.purple)

            // default text-only buttons
            Button("Default Button Style") {
                // your code here
            }

            Text("You can customize the text shown for a button")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding()
                .background(Color.purple)

            // Use this initiallizer to customize the text.
            Button(action: {
                // your code here
            }, label: {
                Text("Headline Font")
                    .font(.headline)
            })

            Divider()

            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Foreground Color")
                    .foregroundColor(Color.red)
            })

            Divider()

            Button(action: {}, label: {
                Text("Thin Font Weight")
                    .fontWeight(.thin)
            })
        }
    }
}

// For more text customization options, see the chapter on Text.

struct Button_Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Button_Introduction()
    }
}
