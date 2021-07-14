//
//  DisableTextFields.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct DisableTextFields: View {
    @State private var lastName = "Moeykens"
    @State private var city = "Salt Lake City"
    @State private var disabled = false
    var body: some View {
        VStack(spacing: 10) {
            Text("TextField")
                .font(.largeTitle)
            Text("Disabled")
                .foregroundColor(.gray)
            Text("You may need to conditionally enable/disable text fields. Just use the disabled modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            Toggle("Keep Info Private", isOn: $disabled)
                .padding(.horizontal)

            Group {
                TextField("Enter Last Name", text: $lastName)
                TextField("Enter City", text: $city)
            }
            .disableAutocorrection(true)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            // Don't allow to edit when disabled
            .padding(.horizontal)
            // Fade out when disabled
            .opacity(disabled ? 0.5 : 1)

            Spacer()
        }
        .font(.title)
    }
}

// Note: The Disabled modifier applier to ANY VIEW. Not just the TextField view.

struct DisableTextFields_Previews: PreviewProvider {
    static var previews: some View {
        DisableTextFields()
    }
}
