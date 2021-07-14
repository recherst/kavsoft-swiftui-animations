//
//  DisablingAutocorrect.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct DisablingAutocorrect: View {
    @State private var textFieldData = ""
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("Autocorrection")
                .foregroundColor(.gray)
            Text("You may have noticed that space above some of the keyboard types that offer autocorrection. You can turn this off with the disableAutocorrection modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            TextField("Enter Last Name", text: $textFieldData)
                // Don't offer suggestions
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Enter City", text: $textFieldData)
                // Offer suggestions
                .disableAutocorrection(false)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Spacer()
        }
        .font(.title)
    }
}

struct DisablingAutocorrect_Previews: PreviewProvider {
    static var previews: some View {
        DisablingAutocorrect()
    }
}
