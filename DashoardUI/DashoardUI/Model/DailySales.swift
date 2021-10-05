//
//  DailySales.swift
//  DashoardUI
//
//  Created by recherst on 2021/10/6.
//

import SwiftUI

struct DailySales: Identifiable {
    var id = UUID().uuidString
    var day: Date
    var value: CGFloat
    var show: Bool
}
