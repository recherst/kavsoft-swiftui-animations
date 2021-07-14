//
//  CustomizingColors.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct CustomizingColors: View {
    @State private var textFieldWithText = "With Text"
    @State private var textFieldNoText = ""
    @State private var withOutline = "With Outline"

    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("Customizing")
                .foregroundColor(.gray)
            Text("One way to customize TextFields is to add a shape behind one that has no TextFieldStyle set.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            TextField("Placeholder Text", text: $textFieldWithText)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(hue: 0.126, saturation: 0.47, brightness: 0.993))
                )
                .padding()
            TextField("Placeholder Text", text: $withOutline)
                .padding(10)
                .overlay(
                    // add the outline
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.orange, lineWidth: 2)
                )
                .padding()

            Text("Change text color using the foregoroundColor property.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            TextField("first name", text: $textFieldWithText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.orange)
                .padding(.horizontal)
        }
        .font(.title)
    }
}

struct CustomizingColors_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingColors()
    }
}
