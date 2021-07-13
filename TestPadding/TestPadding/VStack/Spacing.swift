//
//  Spacing.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/5.
//

import SwiftUI

struct Spacing: View {
    var body: some View {
        // set spacing in the initializer.
        VStack(spacing: 80) {
            Text("VStack")
                .font(.largeTitle)

            Text("Spacing")
                .font(.title)
                .foregroundColor(.gray)
            Text("The VStack initializer allows you to set the spacing between all the views inside the VStack")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .font(.title)
                .foregroundColor(.white)
            Image(systemName: "arrow.up.and.down.circle.fill")
                .font(.largeTitle)

            Text("The spacing here between all of these views is 80")
                .font(.title)
        }
    }
}

struct Spacing_Previews: PreviewProvider {
    static var previews: some View {
        Spacing()
    }
}
