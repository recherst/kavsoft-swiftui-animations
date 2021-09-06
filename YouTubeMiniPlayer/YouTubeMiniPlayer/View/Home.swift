//
//  Home.swift
//  YouTubeMiniPlayer
//
//  Created by recherst on 2021/9/6.
//

import SwiftUI

struct Home: View {
    @StateObject var player = VideoPlayerViewModel()

    var body: some View {
        ZStack(alignment: .bottom, content: {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(videos) { video in
                        // Video card view
                        VideoCardView(video: video)
                            .onTapGesture {
                                withAnimation {
                                    player.showPlayer.toggle()
                                }
                            }
                    }
                }
            }

            // Video player view
            if player.showPlayer {
                MiniPlayer()
                // Move from button
                    .transition(.move(edge: .bottom))
            }
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
