//
//  Formatting.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct Formatting: View {
    @State private var modifierActive = true
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Formatting")
                .font(.title)
                .foregroundColor(.gray)

            Text("More modifiers for Text. Some have a parameter that can listen to a @State var to know if they should be active or not.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.green)
                .foregroundColor(.white)
            VStack {
                HStack {
                    Image("Bold")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Bold")
                        .bold()
                    Spacer()
                }
                .padding(.leading, 30)
                HStack {
                    Image("Italic")
                        .resizable()
                        .frame(width: 42, height: 42)
                    Text("Italic")
                        .italic()
                    Spacer()
                }
                .padding(.leading, 30)
                HStack {
                    Image("Strikethrough")
                        .resizable()
                        .frame(width: 42, height: 42)
                    Text("Strikethrough")
                        .strikethrough()
                    Spacer()
                }
                .padding(.leading, 30)
                HStack {
                    Image("Strikethrough")
                        .resizable()
                        .frame(width: 42, height: 42)
                    Text("Green Strikethrough")
                        .strikethrough(modifierActive, color: .green)
                    Spacer()
                }
                .padding(.leading, 30)
                HStack {
                    Image("Underline")
                        .resizable()
                        .frame(width: 42, height: 42)
                    Text("Underline")
                        .underline()
                    Spacer()
                }
                .padding(.leading, 30)
                HStack {
                    Image("Underline")
                        .resizable()
                        .frame(width: 42, height: 42)
                    Text("Green Underline")
                        .underline(modifierActive, color: .green)
                    Spacer()
                }
                .padding(.leading, 30)
            }

            Toggle("Modifiers Active", isOn: $modifierActive)
                .padding(.horizontal)
        }
    }
}

struct Formatting_Previews: PreviewProvider {
    static var previews: some View {
        Formatting()
    }
}
