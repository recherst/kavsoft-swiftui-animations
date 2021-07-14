//
//  FloatingActionButton.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct FloatingActionButton: View {
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Text("Button")
                    .font(.largeTitle)
                Text("Floating")
                    .font(.title)
                    .foregroundColor(.gray)

                Text("You can also create floating buttons by using a ZStack so the button is on the top layer, over everything else")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title)
                    .background(Color.purple)

                Spacer()
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .clipShape(Capsule())
                }
                // Add 30 points on the trailing side of the button
                .padding(.trailing, 30)
            }
        }
    }
}

// See the section on the Overlay modifier in the Layout Modifiers chapter for more
// ways to accomplish the same thing.

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton()
            .preferredColorScheme(.dark)
    }
}
