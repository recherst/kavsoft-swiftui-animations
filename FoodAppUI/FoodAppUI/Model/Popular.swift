//
//  Popular.swift
//  FoodAppUI
//
//  Created by recherst on 2021/8/9.
//

import Foundation

// Model and sample data
struct Popular: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var image: String
    var price: String
}

var popularItems = [
    Popular(title: "Beef Burger", description: "Cheesy Mozarella", image: "burger1", price: "6.59"),
    Popular(title: "Double Burger", description: "Double Beef", image: "burger2", price: "7.49"),
]
