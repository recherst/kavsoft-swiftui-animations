//
//  TrimSolidShape.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct TrimSolidShape: View {
    @State private var circleProgress: CGFloat = 1.0
    private var circlePercentage: Int { Int(circleProgress * 100.0) }

    var body: some View {
        VStack(spacing: 20) {
            Text("Circular Shapes")
                .font(.largeTitle)
            Text("Trim Solid Shapes")
                .font(.title)
                .foregroundColor(.gray)
            Text("Trim your solid shape to only show a percentage of it.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .layoutPriority(1)

            Circle()
                .trim(from: 0, to: circleProgress)
                .fill(Color.purple)
                .frame(height: 300)
                .rotationEffect(.degrees(-90)) // start from top
                .overlay(
                    Text("\(circlePercentage)%")
                        .font(.largeTitle)
                )
                .padding(40)

            VStack {
                Text("Progress")
                HStack {
                    Text("0%")
                    Slider(value: $circleProgress)
                    Text("100%")
                }
            }
            .padding()
        }
        .font(.title)
    }
}

struct TrimSolidShape_Previews: PreviewProvider {
    static var previews: some View {
        TrimSolidShape()
    }
}
