//
//  Video.swift
//  SnapchatTransition
//
//  Created by recherst on 2021/9/5.
//

import SwiftUI
import AVKit

struct Video: Identifiable {
    var id = UUID().uuidString
    var player: AVPlayer
}

func getBundleURL(fileName: String) -> URL {
    let bundle = Bundle.main.path(forResource: fileName, ofType: "mp4")
    return URL(fileURLWithPath: bundle!)
}

var videos = [
    Video(player: AVPlayer(url: getBundleURL(fileName: "video1"))),
    Video(player: AVPlayer(url: getBundleURL(fileName: "video2"))),
    Video(player: AVPlayer(url: getBundleURL(fileName: "video3"))),
    Video(player: AVPlayer(url: getBundleURL(fileName: "video4"))),
    Video(player: AVPlayer(url: getBundleURL(fileName: "video5"))),
    Video(player: AVPlayer(url: getBundleURL(fileName: "video6"))),
    Video(player: AVPlayer(url: getBundleURL(fileName: "video7"))),
    Video(player: AVPlayer(url: getBundleURL(fileName: "video8"))),
]
