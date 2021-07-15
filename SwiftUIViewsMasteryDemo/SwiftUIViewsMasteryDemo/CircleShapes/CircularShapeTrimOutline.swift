//
//  CircularShapeTrimOutline.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct CircularShapeTrimOutline: View {
    @State private var circleProgress: CGFloat = 1.0
    private var circlePencentage: Int { Int(circleProgress * 100.0) }

    var body: some View {
        VStack(spacing: 40) {
            Text("Circular Shapes")
                .font(.largeTitle)
            Text("Trim Function")
                .font(.title)
                .foregroundColor(.gray)
            Text("Trim your shape to only show a percentage of it.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)

            Circle()
                .trim(from: 0, to: circleProgress)
                .stroke(
                    Color.purple,
                    style: StrokeStyle(
                                lineWidth: 40,
                                lineCap: CGLineCap.round
                    )
                )
                .frame(height: 300)
                // start from top
                .rotationEffect(.degrees(-90))
                .overlay(
                    Text("\(circleProgress)")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
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

struct CircularShapeTrimOutline_Previews: PreviewProvider {
    static var previews: some View {
        CircularShapeTrimOutline()
    }
}
