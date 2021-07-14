//
//  TextFieldIntro.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

// In order to get or set the text in a TextField, you need to bind it to a variable.
// This variable is passed into the TextField's initializer. Then, all you need to do
// is change this bound variable's text to change what is in the TextField. Or read
// the bound variable's value to see what text is currently in the TextField.

// This is a push-out horizontally view.

struct TextFieldIntro: View {
    @State private var textfieldData = ""

    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("TextField")
                    .font(.largeTitle)
                Text("Introduction")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("It is required to bind text fields to a variable when using them so you can get/set the text.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
            }
            Text("TextFieldStyle")
                .foregroundColor(.gray)

            Text("By default, TextFields have a plain TextFieldStyle that has no visual content to be seen.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            Image(systemName: "arrow.down.circle")
            TextField("", text: $textfieldData)
            Image(systemName: "arrow.up.circle")
            Text("Use .textFieldStyle(RoundedBorderTextFieldStyle()) to show a border.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            TextField("", text: $textfieldData)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

        }
        .font(.title)
    }
}

struct TextFieldIntro_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldIntro()
    }
}
