//
//  Evently Spaced.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/6.
//

import SwiftUI

struct Evently_Spaced: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Spacer")
            Text("Evently Spaced")
                .font(.title)
                .foregroundColor(.gray)
            Text("Use Spacer to evently space view horizontally so they look good on any device.")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding()
                .background(Color.yellow)

            Text("Before")
            HStack {
                VStack(alignment: .leading) {
                    Text("Names")
                        .font(.largeTitle)
                        .underline()
                    Text("Chase")
                    Text("Rodrigo")
                    Text("Mark")
                    Text("Evans")
                }
                VStack(alignment: .leading) {
                    Text("Color")
                        .font(.largeTitle)
                        .underline()
                    Text("Red")
                    Text("Orange")
                    Text("Green")
                    Text("Blue")
                }
            }

            Text("After")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)

            HStack {
                Spacer()

                VStack(alignment: .leading) {
                    Text("Names")
                        .font(.largeTitle)
                        .underline()
                    Text("Chase")
                    Text("Rodrigo")
                    Text("Mark")
                    Text("Evans")
                }

                Spacer()

                VStack(alignment: .leading) {
                    Text("Color")
                        .font(.largeTitle)
                        .underline()
                    Text("Red")
                    Text("Orange")
                    Text("Green")
                    Text("Blue")
                }
                Spacer()
            }

        }
        .font(.largeTitle)
    }
}

struct Evently_Spaced_Previews: PreviewProvider {
    static var previews: some View {
        Evently_Spaced()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
    }
}
