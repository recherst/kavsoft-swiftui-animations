//
//  Getting Coordinates.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/9.
//

import SwiftUI

struct Getting_Coordinates: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("GeometryReader")
                .font(.largeTitle)
            Text("Getting Coordinates")
                .foregroundColor(.gray)
            Text("Getting the coordinates (x, y) of a geometry view is little different. Take a look at this example:")
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    Text("X: \(geometry.frame(in: CoordinateSpace.local).origin.x)")
                    Text("Y: \(geometry.frame(in: CoordinateSpace.local).origin.y)")
                }
                .foregroundColor(.white)
            }
            .background(Color.pink)

            Text("The local coordinate space will always give you zeros.")
            Text("You need to look globally to get the coordinates inside the current view:")

            GeometryReader { geometry in
                VStack(spacing: 10) {
                    Text("X: \(geometry.frame(in: .global).origin.x)")
                    Text("Y: \(geometry.frame(in: .global).origin.y)")
                }
                .foregroundColor(.white)
            }
            .background(Color.pink)
            .frame(height: 200)
        }
        .font(.title)
        .padding(.horizontal)
    }
}

struct Getting_Coordinates_Previews: PreviewProvider {
    static var previews: some View {
        Getting_Coordinates()
    }
}
