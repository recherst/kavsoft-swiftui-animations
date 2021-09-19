//
//  People.swift
//  PalseRingAnimation
//
//  Created by recherst on 2021/8/8.
//

import AVFoundation

struct People: Identifiable {
    var id = UUID().uuidString
    var image: String
    var name: String
    // Offset will be used for showing user in pulse animation
    var offset: CGSize = CGSize.zero
}

var peoples = [
    People(image: "pic1", name: "iJustine"),
    People(image: "pic2", name: "Jenna Ezarik"),
    People(image: "pic3", name: "Tim"),
    People(image: "pic4", name: "Bill"),
    People(image: "pic5", name: "Jeff")
]

// Random Offsets for top 5 people
var firstFiveOffsets: [CGSize] = [
    // You can change the position of user views by changing the offsets here
    CGSize(width: 100, height: 100),
    CGSize(width: -100, height: -100),
    CGSize(width: -50, height: 130),
    CGSize(width: 50, height: -130),
    CGSize(width: 120, height: -50),
]
