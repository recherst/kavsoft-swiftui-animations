//
//  MiniPlayer.swift
//  YouTubeMiniPlayer
//
//  Created by recherst on 2021/9/6.
//

import SwiftUI

struct MiniPlayer: View {
    var body: some View {
        VStack(spacing: 0) {
            // Video player
            VideoPlayerView()
                .frame(height: 250)

            GeometryReader { reader in
                ScrollView {
                    VStack(spacing: 18) {
                        // Video playback details and buttons
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("M1 MacBook Unboxing And First Impressions")
                                .font(.callout)

                            Text("1.2M Views")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)

                        // Buttons
                        HStack {
                            PlaybackVideoButtons(image: "hand.thumbsup", text: "123K")

                            PlaybackVideoButtons(image: "hand.thumbsdown", text: "1K")

                            PlaybackVideoButtons(image: "square.and.arrow.up", text: "Share")

                            PlaybackVideoButtons(image: "square.and.arrow.down", text: "Download")

                            PlaybackVideoButtons(image: "message", text: "Live Chat")
                        }

                        Divider()

                        VStack(spacing: 15) {
                            ForEach(videos) { video in
                                // Video card view
                                VideoCardView(video: video)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .background(
            Color.white
                .ignoresSafeArea()
        )
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PlaybackVideoButtons: View {
    var image: String
    var text: String
    var body: some View {
        Button(action: {}, label: {
            VStack(spacing: 8) {
                Image(systemName: image)
                    .font(.title3)

                Text(text)
                    .fontWeight(.semibold)
                    .font(.caption)
            }
        })
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
    }
}
