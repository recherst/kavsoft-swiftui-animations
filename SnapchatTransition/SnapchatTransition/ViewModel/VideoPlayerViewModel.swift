//
//  VideoPlayerViewModel.swift
//  SnapchatTransition
//
//  Created by recherst on 2021/9/5.
//

import SwiftUI
import AVKit

class VideoPlayerViewModel: ObservableObject {

    // Hero animation properties
    @Published var showPlayer = false
    @Published var offset: CGSize = .zero
    @Published var scale: CGFloat = 1

    @Published var selectedVideo: Video = Video(player: AVPlayer())
}

