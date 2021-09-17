//
//  AnimatedShape.swift
//  CurvedTabbar
//
//  Created by recherst on 2021/9/17.
//

import SwiftUI

struct AnimatedShape: Shape {
    var centerX: CGFloat
    // Animation path
    var animatableData: CGFloat {
        get { return centerX }
        set { centerX = newValue }
    }

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 15))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 15))

            // Curve
            path.move(to: CGPoint(x: centerX - 35, y: 15))

            path.addQuadCurve(
                to: CGPoint(x: centerX + 35, y: 15),
                control: CGPoint(x: centerX, y: -30)
            )
        }
    }
}
