//
//  Home.swift
//  YouTubeMiniPlayer
//
//  Created by recherst on 2021/9/6.
//

import SwiftUI

struct Home: View {
    @StateObject var player = VideoPlayerViewModel()

    // Gesture state to avoid drag gesture glitches
    @GestureState var gestureOffset: CGFloat = 0

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
                    .offset(y: player.offset)
                    .gesture(
                        DragGesture()
                            .updating($gestureOffset, body: { value, state, _ in
                                state = value.translation.height
                            })
                            .onEnded(onEnded(value:))
                    )
            }
        })
        .onChange(of: gestureOffset, perform: { value in
            onChanged()
        })
        .environmentObject(player)
    }

    func onChanged() {
        if gestureOffset > 0 && !player.isMiniPlayer && player.offset + 70 <= player.height {
            player.offset = gestureOffset
        }
    }

    func onEnded(value: DragGesture.Value) {
        withAnimation(.default) {
            if !player.isMiniPlayer {
                player.offset = 0
                // Close view
                if value.translation.height > UIScreen.main.bounds.height / 3 {
                    player.isMiniPlayer = true
                } else {
                    player.isMiniPlayer = false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
