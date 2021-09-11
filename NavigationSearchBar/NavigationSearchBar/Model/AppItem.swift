//
//  AppItem.swift
//  NavigationSearchBar
//
//  Created by recherst on 2021/9/11.
//

import SwiftUI

struct AppItem: Identifiable {
    var id = UUID().uuidString
    // Both image and name are same
    var name: String
    // Since all are Apple native apps
    var source: String = "Apple"
}

var apps = [
    AppItem(name: "App Store"),
    AppItem(name: "Calculator"),
    AppItem(name: "Calendar"),
    AppItem(name: "Camera"),
    AppItem(name: "Clock"),
    AppItem(name: "FaceTime"),
    AppItem(name: "Health"),
    AppItem(name: "Mail"),
    AppItem(name: "Maps"),
    AppItem(name: "News"),
    AppItem(name: "Phone"),
    AppItem(name: "Safari"),
    AppItem(name: "Settings"),
    AppItem(name: "Stocks"),
    AppItem(name: "Wallet"),
    AppItem(name: "Weather")
]
