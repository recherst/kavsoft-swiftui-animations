//
//  CustomComposition.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct CustomComposition: View {
    @State private var textFieldData = ""
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)
            Text("Custom Composition")
                .foregroundColor(.gray)
            Text("Compose your own custom TextField by piecing together other views.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
            HStack {
                Image(systemName: "manifyingglass")
                    .foregroundColor(.gray)
                TextField("first name", text: $textFieldData)
                Image(systemName: "slider.horizontal.3")
            }
            Divider()

            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .font(.headline)
                TextField("email address", text: $textFieldData)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding()

            HStack {
                TextField("country", text: $textFieldData)
                Button(action: {}, label: {
                    Image(systemName: "chevron.right")
                        .padding(.horizontal)
                })
                .accentColor(.orange)
            }
            .padding()
            .overlay(
                Capsule()
                    .stroke(Color.orange, lineWidth: 1)
            )
            .padding()
        }
        .font(.title)
    }
}

struct CustomComposition_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposition()
    }
}
