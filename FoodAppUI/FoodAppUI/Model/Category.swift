//
//  Category.swift
//  FoodAppUI
//
//  Created by recherst on 2021/8/9.
//

import Foundation

// Model and sample data

struct Category: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
}


var categories = [
    Category(image: "hamburger", title: "Burger"),
    Category(image: "pizza", title: "Pizza"),
    Category(image: "sandwich", title: "Sandwich"),
    Category(image: "cupcake", title: "Cupcake's")
]
