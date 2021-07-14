//
//  FormControl.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
//

import SwiftUI

struct FormControl: View {
    @State private var isOn = true
    @State private var textFieldData = "This is a text field"

    var body: some View {
        Form {
            Section(header: SectionHeader(name: "Controls in a Form")) {
                Text("This will give you an idea of how different controls are rendered in a Form.")
            }

            Section {
                Button(action: {}) { Text("Button") }
                Toggle(isOn: $isOn) { Text("Toggle") }
                Stepper(
                    onIncrement: {},
                    onDecrement: {}
                ) {
                    Text("Stepper")
                }
                TextField("", text: $textFieldData)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Image(systemName: "leaf.arrow.circlepath")
                    .font(.title)
                Circle()
                Text("Notice shapes are centered ☝️")
                TextField("", text: $textFieldData)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }
}

struct SectionHeader: View {
    var name: String

    var body: some View {
        Text(name)
            .font(.largeTitle)
            .foregroundColor(Color.gray)
    }
}

struct FormControl_Previews: PreviewProvider {
    static var previews: some View {
        FormControl()
    }
}
