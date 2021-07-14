//
//  LayoutPriority.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct LayoutPriority: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Layout Priority")
                .foregroundColor(.gray)

            Image("LayoutPriority")
                .resizable()
                .frame(width: 40, height: 40)

            Text("Layout Priority controls which view will get truncated last. The higher the priority, the last it is in line to get truncated.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                // Highest priority to get the space it needs
                .layoutPriority(2)

            Text("This text gets truncated first because it has no priority.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)

            Text("The text view above got truncated because its layout priority is zero (the default). This text view has a priority of 1. The text view on top has a priority of 2.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                // next highest priority
                .layoutPriority(1)
        }
        .font(.title)
    }
}

struct LayoutPriority_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriority()
    }
}
