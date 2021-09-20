//
//  VideoPlayerView.swift
//  SnapchatTransition
//
//  Created by recherst on 2021/9/5.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {

    var player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.videoGravity = .resizeAspectFill
        controller.showsPlaybackControls = false
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {

    }
}
