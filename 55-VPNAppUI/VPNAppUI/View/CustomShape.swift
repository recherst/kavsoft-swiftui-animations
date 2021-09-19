//
//  CustomShape.swift
//  VPNAppUI
//
//  Created by recherst on 2021/9/16.
//

import SwiftUI

struct CustomShape: Shape {

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 70))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 70))

            let midX = rect.width / 2
            let width = rect.width

            let controlWidth = midX - 100

            path.move(to: CGPoint(x: 0, y: 70))

            let to = CGPoint(x: midX, y: -55)
            let control1 = CGPoint(x: controlWidth, y: 70)
            let control2 = CGPoint(x: controlWidth - 30, y: -55)

            let to1 = CGPoint(x: width, y: 70)
            let control3 = CGPoint(x: width - (controlWidth - 30), y: -55)
            let control4 = CGPoint(x: width - controlWidth, y: 70)

            path.addCurve(to: to, control1: control1, control2: control2)
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}
