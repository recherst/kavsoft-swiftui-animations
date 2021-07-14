//
//  Stroke(Outline).swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct Stroke_Outline_: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Circular Shapes")
                .font(.largeTitle)
            Text("Stroke (Outline)")
                .foregroundColor(.gray)
            Text("Use strokes to create outlines around shapes. Using .stroke(Color.purple):")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)

            Circle()
                .stroke(Color.purple)
                .padding()

            Text(".stroke(Color.purple, lineWidth: 20)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)

            Capsule()
                .stroke(Color.purple, lineWidth: 20)
                .padding()

            Text(".stroke(Color.blue, style: StrokeStyle(lineWidth: 10, dash: [15, 10]))")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)

            Ellipse()
                /* dash parameter
                 The 15 represents the length of the dash
                 The 10 represents the length in between dashes
                 */
                .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, dash: [15, 10]))
                .padding()
        }
        .font(.title)
    }
}

struct Stroke_Outline__Previews: PreviewProvider {
    static var previews: some View {
        Stroke_Outline_()
    }
}
