//
//  Minimum Length.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/9.
//

import SwiftUI

struct Minimum_Length: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Spacer")
                .font(.largeTitle)
            Text("Minimum Length")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can set a minimum space to exist between views using the minLength modifier on the Spacer.")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.black)
                .background(Color.yellow)

            Text("No minLength set (system default is used)")
                .bold()

            HStack {
                Image("yosemite")
                    .resizable()
                    .frame(width: 200, height: 80)
                Spacer()
                Text("This is Yosemite National Park")
                    .lineLimit(1)
            }
            .padding()

            Text("minLength = 0")
                .bold()

            HStack {
                Image("yosemite")
                    .resizable()
                    .frame(width: 200, height: 80)
                // Set the minimum length in the Space's initializer
                Spacer(minLength: 0)
                Text("This is Yosemite National Park")
                    .lineLimit(1)
            }
            .padding()

            Text("minLength = 20")
                .bold()

            HStack {
                Image("yosemite")
                    .resizable()
                    .frame(width: 200, height: 80)
                Spacer(minLength: 20)
                Text("This is Yosemite National Park")
                    .lineLimit(1)
            }
            .padding()

        }
    }
}

struct Minimum_Length_Previews: PreviewProvider {
    static var previews: some View {
        Minimum_Length()
            .preferredColorScheme(.dark)
    }
}
