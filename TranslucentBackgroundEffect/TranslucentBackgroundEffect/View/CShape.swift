//
//  CShape.swift
//  TranslucentBackgroundEffect
//
//  Created by recherst on 2021/10/13.
//

import SwiftUI

struct CShape: Shape {

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 35, height: 35)
        )
        return Path(path.cgPath)
    }
}

