//
//  CustomShape.swift
//  ECommerceAppUI
//
//  Created by recherst on 2021/9/13.
//

import SwiftUI

struct CustomShape: Shape {

    func path(in rect: CGRect) -> Path {
        return Path { path in
            let pt1 = CGPoint(x: rect.width, y: 0)
            let pt2 = CGPoint(x: 0, y: rect.height - 100)
            let pt3 = CGPoint(x: 0, y: rect.height)
            let pt4 = CGPoint(x: rect.width, y: rect.height)

            // Set last point as start
            // Since it ends at last

            path.move(to: pt4)

            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 20)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 20)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 20)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 20)

        }
    }
}
