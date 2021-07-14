//
//  TextSizeAndFonts.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct TextSizeAndFonts: View {
    @State private var textFieldData = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)

            Text("With Text Modifiers")
                .foregroundColor(.gray)

            Text("To change the size of the font used within the TextField, you just need to use the font modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            Group {
                TextField("first name", text: $textFieldData)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("first name", text: $textFieldData)
                    .font(Font.system(size: 36, design: .monospaced))
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("first name", text: $textFieldData)
                    .font(Font.system(size: 20, design: .serif))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)

            Text("Notice this also changes the placeholder or hint text in the text field.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
        }
        .font(.title)
    }
}

struct TextSizeAndFonts_Previews: PreviewProvider {
    static var previews: some View {
        TextSizeAndFonts()
    }
}
