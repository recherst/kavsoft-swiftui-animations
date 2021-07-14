//
//  CircleShapesColor.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct CircleShapesColor: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Circle Shapes")
                .font(.largeTitle)
            Text("Colors")
                .foregroundColor(.gray)
            Text("Circular shapes (and other shapes) can have shape styles applied to them. Color is considered a shape style along with different gradient patterns. You 'fill' a shape with color.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .layoutPriority(1)

            Text("Usng .fill(Color.purple)")

            Circle()
                .fill(Color.purple)
                .frame(height: 100)
                .padding()

            Text("using .foregroundColor(.purple)")
            Circle()
                .foregroundColor(.purple)
                .frame(height: 100)
                .padding()

            Text("(Note: The fill modifier applies specifically to shapes. It connot be used on a view.)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .layoutPriority(1)
        }
        .font(.title)
    }
}

struct CircleShapesColor_Previews: PreviewProvider {
    static var previews: some View {
        CircleShapesColor()
    }
}
