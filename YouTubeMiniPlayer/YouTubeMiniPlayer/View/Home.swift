//
//  Home.swift
//  YouTubeMiniPlayer
//
//  Created by recherst on 2021/9/6.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack(alignment: .bottom, content: {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(videos) { video in
                        // Video card view
                        VideoCardView(video: video)
                    }
                }
            }

            // Video player view
            MiniPlayer()
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
