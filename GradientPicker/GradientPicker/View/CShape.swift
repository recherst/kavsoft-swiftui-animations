//
//  CShape.swift
//  GradientPicker
//
//  Created by recherst on 2021/10/11.
//

import SwiftUI

struct CShape: Shape {

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topRight, .bottomLeft],
            cornerRadii: CGSize(width: 55, height: 55)
        )
        return Path(path.cgPath)
    }
}
