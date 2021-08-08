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
