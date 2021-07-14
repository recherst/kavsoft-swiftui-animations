//
//  Button with SF Symbols.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct Button_with_SF_Symbols: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Button")
                .font(.largeTitle)
            Text("With SF Symbols")
                .foregroundColor(.gray)
                .font(.title)

            Text("Buttons can be composed with SF Symbols too.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.purple)

            Button(action: {}) {
                Text("Button With Symbol")
                    .padding(.horizontal)
                Image(systemName: "gift.fill")
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color.purple)
            .cornerRadius(8)

            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                Text("Search")
                    .padding(.horizontal)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(8)

            Button(action: {}) {
                VStack {
                    Image(systemName: "video.fill")
                    Text("Record")
                        .padding(.horizontal)
                }
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color.purple)
            .clipShape(Capsule())
        }
    }
}
// For even more ways to customize buttons, see the chapter on Paints where
// you can learn how to apply the 3 different gradients to them.

struct Button_with_SF_Symbols_Previews: PreviewProvider {
    static var previews: some View {
        Button_with_SF_Symbols()
            .preferredColorScheme(.dark)
    }
}
