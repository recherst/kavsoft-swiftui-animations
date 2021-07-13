//
//  Spacer_Introduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/6.
//

import SwiftUI

struct Spacer_Introduction: View {
    var body: some View {
        VStack {
            Text("Spacer")
                .font(.largeTitle)

            Text("Introduction")
                .foregroundColor(.gray)

            Text("Spacers push things away either vertically or horizontally.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)

            Image(systemName: "arrow.up.circle.fill")

            Spacer() // Pushes away vertically when in a VStack.

            Image(systemName: "arrow.down.circle.fill")

            HStack {
                Text("Horizontal Spacer")

                Image(systemName: "arrow.left.circle.fill")

                Spacer() // Pushes away horizontally when in an HStack.

                Image(systemName: "arrow.right.circle.fill")

            }
            .padding(.horizontal)

            Color.yellow
                .frame(maxHeight: 50) // height can decrease but not go higher than 50
        }
        // Apply this font to every view within the VStack
        .font(.title)
    }
}

struct Spacer_Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Spacer_Introduction()
            .preferredColorScheme(.dark)
            
    }
}
