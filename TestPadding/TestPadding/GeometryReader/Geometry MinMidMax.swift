//
//  Geometry MinMidMax.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/9.
//

import SwiftUI

struct Geometry_MinMidMax: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("GeometryReader")
                .font(.largeTitle)

            Text("Min Mid Max")
                .foregroundColor(.gray)

            Text("You can also get the minimum (min), middle (mid), and maximum (max) X and Y coordinate from the geometry reader.")
                .layoutPriority(1)

            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 20) {
                    Text("Local Coordinate Space")
                    HStack(spacing: 10) {
                        // I'm converting to Int just so we don't have so many zeros
                        Text("minX: \(Int(geometry.frame(in: .local).minY))")
                        Spacer()
                        Text("midX: \(Int(geometry.frame(in: .local).midX))")
                        Spacer()
                        Text("maxX: \(Int(geometry.frame(in: .local).maxX))")
                    }
                    Text("Global Coordinate Space")
                    HStack(spacing: 10) {
                        // I'm converting to Int just so we don't have so many zeros
                        Text("minX: \(Int(geometry.frame(in: .global).minX))")
                        Spacer()
                        Text("midX: \(Int(geometry.frame(in: .global).midX))")
                        Spacer()
                        Text("maxX: \(Int(geometry.frame(in: .global).maxX))")
                    }
                    .padding(.horizontal)
                }
                .frame(height: 200)
                .foregroundColor(.white)
                .background(Color.pink)

                HStack {
                    GeometryReader { geometry in
                        VStack(spacing: 10) {
                            Text("minY: \(Int(geometry.frame(in: .global).minY))")
                            Text("midY: \(Int(geometry.frame(in: .global).midY))")
                            Text("maxY: \(Int(geometry.frame(in: .global).maxY))")
                        }
                        .padding()
                    }
                    .foregroundColor(.white)
                    .background(Color.pink)

                    Image("MinMidMax")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .font(.title)
            .padding()
        }
    }
}

// Notice how the min, mid and max values change as the geometry reader adapts to different device sizes.

struct Geometry_MinMidMax_Previews: PreviewProvider {
    static var previews: some View {
        Geometry_MinMidMax()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
    }
}
