//
//  AlbumData.swift
//  AudioVisualizer
//
//  Created by recherst on 2021/9/28.
//

import SwiftUI

class AlbumData: ObservableObject {
    
    @Published var isPlaying = false
    @Published var title = ""
    @Published var artist = ""
    @Published var artwork = Data(count: 0)
    @Published var type = ""
}
