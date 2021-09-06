//
//  VideoControls.swift
//  YouTubeMiniPlayer
//
//  Created by recherst on 2021/9/6.
//

import SwiftUI

struct VideoControls: View {
    @EnvironmentObject var player: VideoPlayerViewModel
    var body: some View {
        HStack(spacing: 15) {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 150, height: 70)

            VStack(alignment: .leading, spacing: 6, content: {
                Text("M1 MacBook Unboxing And First Impressions")
                    .font(.callout)
                    .foregroundColor(.black)
                    .lineLimit(1)

                Text("Kavsoft")
                    .fontWeight(.bold)
                    .font(.caption)
                    .foregroundColor(.gray)
            })

            Button(action: {}, label: {
                Image(systemName: "pause.fill")
                    .font(.title2)
                    .foregroundColor(.black)
            })

            Button(action: {
                player.showPlayer.toggle()
                player.offset = 0
                player.isMiniPlayer.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            })
        }
        .padding(.trailing)
    }
}
