//
//  Item.swift
//  CartUI
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var name: String
    var details: String
    var image: String
    var price: Float
    var quantity: Int
    var offset: CGFloat
    var isSwiped: Bool
}
