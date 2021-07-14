//
//  SecureFieldIntroduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

// In Order to get or set the text in a SecureField, You need to bind it to a variable.
// This variable is passed into the SecureField's initializer. Then, all you need to do
// is change this bound variable's text to change what is in the SecureField. Or read
// the bound variable's value to see what text is currently in the SecureField.

// This is a pull-in control.

struct SecureFieldIntroduction: View {
    @State private var userName = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Image("logo")
                .resizable()
                .frame(width: 80, height: 80)

            Spacer()

            Text("SecureField")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)

            Text("SecureFields, like TextFields, need to bind to a local variable.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.purple)
                .foregroundColor(Color.white)

            TextField("user name", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Spacer()
        }
    }
}

struct SecureField_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldIntroduction()
            .preferredColorScheme(.dark)
    }
}
