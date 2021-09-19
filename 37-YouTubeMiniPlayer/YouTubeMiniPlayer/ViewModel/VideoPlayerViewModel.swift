//
//  VideoPlayerViewModel.swift
//  YouTubeMiniPlayer
//
//  Created by recherst on 2021/9/6.
//

import SwiftUI

class VideoPlayerViewModel: ObservableObject {
    // MiniPlayer properties
    @Published var showPlayer = false

    // Gesture offset
    @Published var offset: CGFloat = 0
    @Published var width: CGFloat = UIScreen.main.bounds.width
    @Published var height: CGFloat = 0
    @Published var isMiniPlayer = false
}
