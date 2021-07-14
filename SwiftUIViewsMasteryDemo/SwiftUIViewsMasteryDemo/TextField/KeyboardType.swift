//
//  KeyboardType.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct KeyboardType: View {
    @State private var textFieldData = ""
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("keyboardType")
                .foregroundColor(.gray)
            Image("KeyboardType")
                .resizable()
                .frame(width: 40, height: 40)
            Text("Control which keyboard is shown with the keyboardType modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            TextField("Enter Phone Number", text: $textFieldData)
                // Show keyboard for phone numbers
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Spacer()
        }
        .font(.title)
    }
}

struct KeyboardType_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardType()
    }
}
