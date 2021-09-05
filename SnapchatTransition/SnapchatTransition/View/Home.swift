//
//  Home.swift
//  SnapchatTransition
//
//  Created by recherst on 2021/9/5.
//

import SwiftUI

struct Home: View {
    // For dark mode or light
    @Environment(\.colorScheme) var scheme
    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)

    // Animation Namespace
    @Namespace var animation

    @StateObject var playerViewModel = VideoPlayerViewModel()

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "person.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.pink)
                    })

                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "person.fill.badge.plus")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                    })
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .overlay(
                    Text("Discover")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                )
                .background(scheme == .dark ? Color.black : Color.white)
                .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 0, y: 5)

                ScrollView {
                    LazyVGrid(columns: columns, content: {
                        ForEach(videos) { video in
                            VideoPlayerView(player: video.player)
                                .cornerRadius(15)
                                .matchedGeometryEffect(id: video.id, in: animation)
                                .scaleEffect(playerViewModel.showPlayer && playerViewModel.selectedVideo.id == video.id ? playerViewModel.scale : 1)
                                .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 280)
                                .onTapGesture {
                                    withAnimation {
                                        playerViewModel.selectedVideo = video
                                        playerViewModel.showPlayer = true
                                    }
                                }
                                .zIndex(0)
                        }
                    })
                    .padding()
                }
            }

            if playerViewModel.showPlayer {
                VideoPlayerView(player: playerViewModel.selectedVideo.player)
                    .cornerRadius(15)
                    .scaleEffect(playerViewModel.scale)
                    .matchedGeometryEffect(id: playerViewModel.selectedVideo.id, in: animation)
                    .offset(playerViewModel.offset)
                    .gesture(
                        DragGesture()
                            .onChanged(onChanged(value:))
                            .onEnded(onEnded(value:))
                    )
                    // Player video when opens
                    .onAppear(perform: {
                        playerViewModel.selectedVideo.player.play()
                    })
                    .ignoresSafeArea(.all, edges: .all)
                    .zIndex(3)
            }
        }
    }

    func onChanged(value: DragGesture.Value) {
        // Only moving view when swipe down
        if value.translation.height > 0 {
            playerViewModel.offset = value.translation

            // Scale view
            let screenHeight = UIScreen.main.bounds.height - 50
            let progress = playerViewModel.offset.height / screenHeight

            if 1 - progress > 0.5 {
                playerViewModel.scale = 1 - progress
            }
        }
    }

    func onEnded(value: DragGesture.Value) {
        // Reset view
        withAnimation(.default) {
            // Check and close view
            if value.translation.height > 300 {
                // Stop playing video
                playerViewModel.selectedVideo.player.pause()
                playerViewModel.showPlayer = false
            }

            playerViewModel.offset = .zero
            playerViewModel.scale = 1
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
