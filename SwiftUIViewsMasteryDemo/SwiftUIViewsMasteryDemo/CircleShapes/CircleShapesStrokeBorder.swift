//
//  CircleShapesStrokeBorder.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct CircleShapesStrokeBorder: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Circular Shapes")
                .font(.largeTitle)
            Text("Stroke Border (Inner Stroke)")
                .foregroundColor(.gray)
            Text("A stroke modifier grows outward from the center of the shape's outline and can cause overlapping issues.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)

            ZStack {
                Capsule()
                    .stroke(Color(UIColor.purple), lineWidth: 50)
                Capsule()
                    .stroke() // black outline
            }

            Text("A strokeBorder modifier will grow inward from the shape's outline.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)

            ZStack {
                Capsule()
                    .stroke(Color.purple, lineWidth: 50)
                Capsule()
                    .stroke() // black outline
            }
        }
        .font(.title)
    }
}

struct CircleShapesStrokeBorder_Previews: PreviewProvider {
    static var previews: some View {
        CircleShapesStrokeBorder()
    }
}
