//
//  Range.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

// When the Stepper reaches the range limits, the corresponding plus or minus button will
// appear as disabled. In this screenshot, notice the plus button is disabled.

struct Range: View {
    @State private var stars = 5

    var body: some View {
        VStack(spacing: 20) {
            Text("Stepper")
                .font(.largeTitle)
            Text("Range of Values")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can set a range for the stepper too. In this example, the range is between one and five.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)

            Stepper(value: $stars, in: 1...5) {
                Text("Rating")
            }
            .padding(.horizontal)

            HStack {
                ForEach(1...stars, id: \.self) { star in
                    Image(systemName: "star.fill")
                }
            }
            .font(.title)
            .foregroundColor(.yellow)

        }
        .font(.title)
    }
}

struct Range_Previews: PreviewProvider {
    static var previews: some View {
        Range()
    }
}
