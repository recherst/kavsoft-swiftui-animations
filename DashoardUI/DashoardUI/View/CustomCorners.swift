//
//  CustomCorners.swift
//  DashoardUI
//
//  Created by recherst on 2021/10/6.
//

import SwiftUI

struct CustomCorners: Shape {
    var corners: UIRectCorner
    var size: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
        return Path(path.cgPath)
    }
}

