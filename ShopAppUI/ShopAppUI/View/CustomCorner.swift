//
//  CustomCorner.swift
//  ShopAppUI
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI

struct CustomCorner: Shape {

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 35, height: 35)
        )

        return Path(path.cgPath)
    }
}
