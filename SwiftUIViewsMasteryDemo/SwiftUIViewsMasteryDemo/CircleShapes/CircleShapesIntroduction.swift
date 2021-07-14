//
//  CircleShapesIntroduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct CircleShapesIntroduction: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Circle Shapes")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)
            Text("There are three circle shapes available in SwiftUI:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(Color.white)
                .layoutPriority(1)

            Text("Circle")
            Circle()
                .padding()

            Text("Capsule")
            Capsule()
                .padding()

            Text("Ellipse")
            Ellipse()
                .padding()

            Text("(Notice the default colors default to the primary color.)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .layoutPriority(1)
        }
        .font(.title)
    }
}

struct CircleShapesIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        CircleShapesIntroduction()
    }
}
