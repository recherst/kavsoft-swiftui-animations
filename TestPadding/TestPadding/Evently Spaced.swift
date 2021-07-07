//
//  Evently Spaced.swift
//  TestPadding
//
//  Created by 刘勇刚 on 2021/7/6.
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
