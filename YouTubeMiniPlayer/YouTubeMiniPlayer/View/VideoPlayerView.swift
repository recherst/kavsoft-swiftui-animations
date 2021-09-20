//
//  VideoPlayerView.swift
//  YouTubeMiniPlayer
//
//  Created by recherst on 2021/9/6.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let bundleURL = Bundle.main.path(forResource: "video", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: bundleURL!)
        let player = AVPlayer(url: videoURL)
        controller.player = player
        controller.showsPlaybackControls = false
        controller.player?.play()
        controller.videoGravity = .resizeAspectFill
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {

    }
}

