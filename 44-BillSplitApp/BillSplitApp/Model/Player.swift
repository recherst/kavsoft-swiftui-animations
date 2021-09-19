//
//  Payer.swift
//  BillSplitApp
//
//  Created by recherst on 2021/9/8.
//

import SwiftUI

struct Payer: Identifiable {
    var id = UUID().uuidString
    var image: String
    var name: String
    var bgColor: Color
    // offset for custom progress view
    var offset: CGFloat = 0
}

