//
//  CustomShape.swift
//  NikeApp
//
//  Created by recherst on 2021/10/3.
//

import SwiftUI

struct CustomShape: Shape {

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft],
            cornerRadii: CGSize(width: 85, height: 85)
        )
        return Path(path.cgPath)
    }
}
