//
//  Friend.swift
//  CustomScrollView
//
//  Created by recherst on 2021/8/16.
//

import SwiftUI

// Friend Model
struct Friend: Identifiable {

    var id = UUID().uuidString
    var name: String
    var detail: String
    var image: String
}

// Model Data

var friends = [
    Friend(name: "iJustine", detail: "5 Miles Away", image: "justine"),
    Friend(name: "Kaviya", detail: "0.5 Miles Away", image: "animoji3"),
    Friend(name: "Tom", detail: "3 Miles Away", image: "animoji1"),
    Friend(name: "Oliver", detail: "4 Miles Away", image: "animoji2"),
    Friend(name: "Anna", detail: "1 Miles Away", image: "animoji3"),
    Friend(name: "Steve", detail: "2 Miles Away", image: "animoji1"),
    Friend(name: "Jenna", detail: "10 Miles Away", image: "animoji3"),
    Friend(name: "Creg", detail: "1 Miles Away", image: "animoji2"),
    Friend(name: "Tom Land", detail: "3 Miles Away", image: "animoji1"),
    Friend(name: "Tom", detail: "3 Miles Away", image: "animoji1"),
    Friend(name: "Oliver", detail: "4 Miles Away", image: "animoji2"),
    Friend(name: "Anna", detail: "1 Miles Away", image: "animoji3"),
    Friend(name: "Steve", detail: "2 Miles Away", image: "animoji1"),
    Friend(name: "Jenna", detail: "10 Miles Away", image: "animoji3"),
    Friend(name: "Creg", detail: "1 Miles Away", image: "animoji2"),
    Friend(name: "Tom Land", detail: "3 Miles Away", image: "animoji1"),
]
