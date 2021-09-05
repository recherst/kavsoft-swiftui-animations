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

    var body: some View {
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
                            .frame(height: 280)
                    }
                })
                .padding()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
