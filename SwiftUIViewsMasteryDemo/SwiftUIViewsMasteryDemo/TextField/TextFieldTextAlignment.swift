//
//  TextFieldTextAlignment.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct TextFieldTextAlignment: View {
    @State private var textFieldData1 = "Leading"
    @State private var textFiledData2 = "Center"
    @State private var textFieldData3 = "Trailing"

    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("Text Alignment")
                .foregroundColor(.gray)

            Text("Change the alignment of text within your textfield by using the multilineTextAlignment modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            Group {
                TextField("Leading", text: $textFieldData1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading) // default

                TextField("Center", text: $textFiledData2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)

                TextField("Trailing", text: $textFieldData3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct TextFieldTextAlignment_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTextAlignment()
    }
}
