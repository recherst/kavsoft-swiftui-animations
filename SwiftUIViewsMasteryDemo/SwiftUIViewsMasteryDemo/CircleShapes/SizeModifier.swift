//
//  SizeModifier.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct SizeModifier: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Circular Shapes")
                .font(.largeTitle)
            Text("Size Modifier")
                .foregroundColor(.gray)
            Text("You can also use the shape's size modifier to define a height and within. Take warning, though, using size no longer aligns shapes to the center.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .layoutPriority(1)

            Group {
                Text(".size(width: 80, height: 80)")
                Circle()
                    .size(width: 80, height: 80)
                    .background(Color.purple)
            }
            .padding()
        }
        .font(.title)
    }
}

struct SizeModifier_Previews: PreviewProvider {
    static var previews: some View {
        SizeModifier()
    }
}
