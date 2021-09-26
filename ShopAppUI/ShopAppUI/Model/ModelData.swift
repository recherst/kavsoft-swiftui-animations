//
//  ModelData.swift
//  ShopAppUI
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI

struct BagModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var price: String
}

var bags = [
    BagModel(image: "bag1", title: "Office Bag", price: "$234"),
    BagModel(image: "bag5", title: "Stylus Bag", price: "$434"),
    BagModel(image: "bag6", title: "Round Belt", price: "$134"),
    BagModel(image: "bag2", title: "Belt Bag", price: "$294"),
    BagModel(image: "bag3", title: "Hang Top", price: "$204"),
    BagModel(image: "bag4", title: "Old Fashion", price: "$334")
]

// For top scrolling tab buttons
var scrollTabs = [
    "Hand Bag", "Jewellery", "Footwear", "Dresses", "Beauty"
]
