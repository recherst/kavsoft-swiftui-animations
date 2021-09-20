//
//  MiniPlayer.swift
//  YouTubeMiniPlayer
//
//  Created by recherst on 2021/9/6.
//

import SwiftUI

struct MiniPlayer: View {
    // ScreenHeight
    @EnvironmentObject var player: VideoPlayerViewModel
    var body: some View {
        VStack(spacing: 0) {
            // Video player
            HStack {
                VideoPlayerView()
                    .frame(width: player.isMiniPlayer ? 150 : player.width, height: player.isMiniPlayer ? 70 : getFrame())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                VideoControls()
            )

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
                .onAppear(perform: {
                    player.height = reader.frame(in: .global).height + 250
                })
            }
            .background(Color.white)
            .opacity(player.isMiniPlayer ? 0 : getOpacity())
            .frame(height: player.isMiniPlayer ? 0 : nil)
        }
        .background(
            Color.white
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        player.width = UIScreen.main.bounds.width
                        player.isMiniPlayer.toggle()
                    }
                }
        )
    }

    // Get frame and opacity while dragging
    func getFrame() -> CGFloat {
        let progress = player.offset / (player.height - 100)

        if (1 - progress) <= 1.0 {
            let videoHeight: CGFloat = (1 - progress) * 250

            // Stop height at 70
            if videoHeight <= 70 {
                // Decrease with
                let percent = videoHeight / 70
                let videoWidth: CGFloat = percent * UIScreen.main.bounds.width
                DispatchQueue.main.async {
                    // Stop at 150
                    if videoWidth >= 150 {
                        player.width = videoWidth
                    }
                }
                // Preview will have animation problems
                DispatchQueue.main.async {
                    player.width = UIScreen.main.bounds.width
                }
                return 70
            }
            return videoHeight
        }

        return 250
    }

    func getOpacity() -> Double {
        let progress = player.offset / player.height
        if progress <= 1 {
            return Double(1 - progress)
        }
        return 1
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
