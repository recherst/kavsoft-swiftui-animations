//
//  Travel.swift
//  HeroAnimation
//
//  Created by recherst on 2021/10/14.
//

import SwiftUI

struct Travel: Identifiable {
    var id: Int
    var image: String
    var title: String
}

var data = [
    Travel(id: 0, image: "p1", title: "London"),
    Travel(id: 1, image: "p2", title: "USA"),
    Travel(id: 2, image: "p3", title: "Canada"),
    Travel(id: 3, image: "p4", title: "Australia"),
    Travel(id: 4, image: "p5", title: "Germany"),
    Travel(id: 5, image: "p6", title: "Dubai")
]
