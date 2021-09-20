//
//  Video.swift
//  YouTubeMiniPlayer
//
//  Created by recherst on 2021/9/6.
//

import SwiftUI

struct Video: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
}

var videos = [
    Video(image: "thumb1", title: "Advanced Map Kit Tutorials"),
    Video(image: "thumb2", title: "Realm DB CURD Operations"),
    Video(image: "thumb3", title: "SwiftUI Complex Chat App UI"),
    Video(image: "thumb4", title: "Animated Sticky Header"),
    Video(image: "thumb5", title: "Shared App For Both macOS And iOS"),
]

