//
//  CapsuleRoundedCornerStyle.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct CapsuleRoundedCornerStyle: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Capsule")
                .font(.largeTitle)
            Text("Rounded Corner Style")
                .foregroundColor(.gray)

            Text("The Capsule shape offers two different styles for its rounded corners.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .layoutPriority(1)

            Text("RoundedCornerStyle.circlar")
            Capsule(style: RoundedCornerStyle.circular)
                .padding()

            Text("RoundedCornerStyle.continuous")
            Capsule(style: RoundedCornerStyle.continuous)
                .padding()
        }
        .font(.title)
    }
}

struct CapsuleRoundedCornerStyle_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleRoundedCornerStyle()
    }
}
