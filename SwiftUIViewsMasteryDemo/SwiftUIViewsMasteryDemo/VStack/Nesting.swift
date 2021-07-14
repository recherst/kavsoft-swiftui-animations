//
//  Nesting.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/5.
//

import SwiftUI

struct Nesting: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 20) {
                Text("VStack")
                Text("Nesting")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("A VStack can be nested within another VStack when laying out views.")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
            VStack {
                Text("VStack inside another VStack")
                Divider()
                Text("This can be helpful. Why?")
                Divider()
                Text("More than 10 views create an error.")
            }
            .padding()
            .foregroundColor(Color.white)
            .background(
                // Use a blue rectangle as the background
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
            )
            .padding()
        }
        .font(.title)
    }
}

struct Nesting_Previews: PreviewProvider {
    static var previews: some View {
        Nesting()
    }
}
