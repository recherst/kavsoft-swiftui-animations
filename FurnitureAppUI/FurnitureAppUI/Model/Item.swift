//
//  Item.swift
//  FurnitureAppUI
//
//  Created by recherst on 2021/9/19.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var title: String
    var price: String
    var subTitle: String
    var image: String
    var offset: CGFloat = 0
}
