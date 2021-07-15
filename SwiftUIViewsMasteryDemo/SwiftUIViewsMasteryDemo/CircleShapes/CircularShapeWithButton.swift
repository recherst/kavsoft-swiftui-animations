//
//  CircularShapeWithButton.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct CircularShapeWithButton: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Circular Shapes")
                .font(.largeTitle)
            Text("Using with Buttons")
                .foregroundColor(.gray)
            Text("You can apply circular shapes to other views using the .background modifier")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .layoutPriority(1)

            Button(action: {}) {
                Text("Use the Capsule shape")
                    .bold()
                    .padding()
            }
            .background(
                Capsule()
                    .strokeBorder(Color.purple, lineWidth: 1)
            )
            .accentColor(.purple)

            Button(action: {}) {
                Text("Use the Capsule shape")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
            }
            .background(
                Capsule()
                    .foregroundColor(.purple)
            )
            .accentColor(.purple)

            Text("Circle and Button combination:")

            Button(action: {}) {
                Image(systemName: "circle.grid.hex.fill")
                    .font(.largeTitle)
                    .padding()
            }
            .background(Circle())
            .foregroundColor(.purple)
            .accentColor(.white)
        }
        .font(.title)
    }
}

struct CircularShapeWithButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularShapeWithButton()
    }
}
