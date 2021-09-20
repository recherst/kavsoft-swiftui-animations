//
//  Trip.swift
//  CustomCarouselSlider
//
//  Created by recherst on 2021/7/31.
//

import Foundation

// Model and sample data...
struct Trip: Identifiable, Hashable {

    var id = UUID().uuidString
    var image: String
    var title: String
}

var trips = [
    Trip(image: "p2", title: "Mountain"),
    Trip(image: "p6", title: "Big Sur"),
    Trip(image: "p5", title: "High Sierra"),
    Trip(image: "p3", title: "Ocean"),
    Trip(image: "p4", title: "Hills"),
    Trip(image: "p1", title: "Village"),
]
