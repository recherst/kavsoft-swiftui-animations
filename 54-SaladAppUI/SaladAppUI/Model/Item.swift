//
//  Item.swift
//  SaladAppUI
//
//  Created by recherst on 2021/9/15.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var name: String
    var price: String
    var image: String
}


var items = [
    Item(name: "Meat Salad", price: "$6.50", image: "p1"),
    Item(name: "Chicken Salad", price: "$20.60", image: "p3"),
]
