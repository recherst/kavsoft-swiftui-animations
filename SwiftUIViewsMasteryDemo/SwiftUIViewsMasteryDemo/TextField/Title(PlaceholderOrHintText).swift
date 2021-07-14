//
//  Title(PlaceholderOrHintText).swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct Title_PlaceholderOrHintText_: View {
    @State private var textfieldData = ""
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("Title Text (Placeholder or hint)")
                .foregroundColor(.gray)
            Text("You can supply title text (placeholder/hint text) through the first parameter to let the user know the purpose of the text field.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            Group {
                TextField("Here is title text", text: $textfieldData)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("User name", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
        }
        .font(.title)
     }
}

struct Title_PlaceholderOrHintText__Previews: PreviewProvider {
    static var previews: some View {
        Title_PlaceholderOrHintText_()
    }
}
