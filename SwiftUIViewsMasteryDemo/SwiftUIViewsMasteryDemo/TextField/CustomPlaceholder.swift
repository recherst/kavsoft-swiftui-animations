//
//  CustomPlaceholder.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct CustomPlaceholder: View {
    @State private var textFieldData = ""

    var body: some View {
        VStack(spacing: 40) {
            Text("TextField")
                .font(.largeTitle)
            Text("Custom Placeholder/Hint Text")
                .foregroundColor(.gray)
            Text("There currently is not a way to customize the placeholder text. You can create your own placeholder text behind the text field.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            Group {
                // First TextField
                ZStack(alignment: .leading) {
                    // only show custom hint text if there is no text entered
                    if textFieldData.isEmpty {
                        Text("Enter name here")
                            .bold()
                            .foregroundColor(Color(.systemGray4))
                    }
                    TextField("", text: $textFieldData)
                }
                .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
                .overlay(
                    // add the outline
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.orange, lineWidth: 2)
                )

                // second TextField
                ZStack(alignment: .leading) {
                    if textFieldData.isEmpty {
                        Text("Email Address")
                            .italic()
                            .foregroundColor(.orange)
                            .opacity(0.4)
                    }
                    TextField("", text: $textFieldData)
                }
                .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)
            }
        }
        .font(.title)
    }
}

struct CustomPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        CustomPlaceholder()
    }
}
