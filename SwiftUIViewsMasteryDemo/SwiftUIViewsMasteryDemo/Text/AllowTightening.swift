//
//  AllowTightening.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct AllowTightening: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Allows Tightening")
                .font(.title)
                .foregroundColor(.gray)
            Text("You might want to tighten up some text that might be too long.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.green)
                .foregroundColor(Color.white)

            Text("In the example below, the green has .allowTightening(true):")
                .font(.title)

            Group {
                Text("Allows tightening to allow text to fit in one line.")
                    .foregroundColor(.red)
                    .allowsTightening(false)
                    .padding(.horizontal)
                    .lineLimit(1)

                Text("Allows tightening to allow text fit in one line.")
                    .foregroundColor(.green)
                    .allowsTightening(true)
                    .padding(.horizontal)
                    .lineLimit(1)
            }
        }
    }
}

// Allows Tightening can be helpful when you see the last word getting truncated. Applying
// it may not even fully work depending on just how much space can be tightened. With the
// default font, I notice I can get a couple of characters worth of space to tighten up.

struct AllowTightening_Previews: PreviewProvider {
    static var previews: some View {
        AllowTightening()
    }
}
