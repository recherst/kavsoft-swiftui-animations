//
//  Home.swift
//  CustomScrollView
//
//  Created by recherst on 2021/8/16.
//

import SwiftUI

struct Home: View {
    @State var searchQuery = ""
    @State var offset: CGFloat = 0
    // Start offset
    @State var startOffset: CGFloat = 0

    // To move title to center were getting the title width
    @State var titleOffset: CGFloat = 0

    // To get the scrollview padded from the top we're going to get the height of the title bar
    @State var titleBarheight: CGFloat = 0

    // To adpot for mark mode
    @Environment(\.colorScheme) var scheme

    var body: some View {
        ZStack(alignment: .top) {
            // Moving the search bar to top if user starts typing

            VStack {
                if searchQuery == "" {
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "star")
                                .font(.title2)
                                .foregroundColor(.primary)
                        })

                        Spacer()

                        Button(action: {}, label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.primary)
                        })
                    }
                    .padding()

                    HStack {
                        (
                            Text("My ")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            +
                            Text("friends")
                                .foregroundColor(.gray)
                        )
                        .font(.largeTitle)
                        .overlay(
                            GeometryReader { geometry -> Color in
                                let width = geometry.frame(in: .global).maxX
                                DispatchQueue.main.async {
                                    // Store
                                    if titleOffset == 0 {
                                        titleOffset = width
                                    }
                                }
                                return Color.clear
                            }
                            .frame(width: 0, height: 0)
                        )
                        .padding()
                        // Scaling
                        .scaleEffect(getScale)
                        // Getting offset and moving the view
                        .offset(getOffset)

                        Spacer()
                    }
                }

                VStack {
                    // Search bar
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundColor(.gray)

                        TextField("Seach", text: $searchQuery)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.primary.opacity(0.05))
                    .cornerRadius(8)
                    .padding()

                    if searchQuery == "" {
                        // Divider line
                        HStack {
                            Text("RECENTS")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)

                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height: 0.5)
                        }
                        .padding()
                    }
                }
                .offset(y: offset > 0 && searchQuery == "" ? (offset <= 95 ? -offset : -95) : 0)
            }
            .zIndex(1)
            // Padding bottom
            // To decrease height of the view
            .padding(.bottom, searchQuery == "" ? getOffset.height : 0)
            .background(
                ZStack {
                    let color = scheme == .dark ? Color.black : Color.white
                    LinearGradient(gradient: .init(colors: [color, color, color, color.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                }
                .ignoresSafeArea()
            )
            .overlay(
                GeometryReader { geometry -> Color in
                    let height = geometry.frame(in: .global).maxY
                    DispatchQueue.main.async {
                        if titleBarheight == 0 {
                            titleBarheight = height - (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                        }
                    }
                    return Color.clear
                }
            )
            // Animating only if user starts typing
            .animation(.easeInOut, value: searchQuery != "")

            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    ForEach(friends) { friend in
                        FriendRowView(friend: friend)
                    }
                }
                .padding(.top, 10)
                .padding(.top, searchQuery == "" ? titleBarheight : 90)
                // Get offset by using geometry reader
                .overlay(
                    GeometryReader { geometry -> Color in
                        let minY = geometry.frame(in: .global).minY
                        DispatchQueue.main.async {
                            // To get original offset
                            // ie from 0
                            // just minus start offset
                            if startOffset == 0 {
                                startOffset = minY
                            }
                            offset = startOffset - minY
                        }
                        return Color.clear
                    }
                    .frame(width: 0, height: 0)

                    ,alignment: .top
                )
            })
        }
    }

    var getOffset: CGSize {
        var size: CGSize = .zero
        let screenWidth = UIScreen.main.bounds.width / 2
        // Since width is slow we're multiplying with 1.5
        size.width = offset > 0 ? (offset * 1.5 <= (screenWidth - titleOffset) ? offset * 1.5 : (screenWidth - titleOffset)) : 0
        size.height = offset > 0 ? (offset < 75 ? -offset : -75) : 0
        return size
    }

    var getScale: CGFloat {
        if offset > 0 {
            let screenWidth = UIScreen.main.bounds.width
            let progress = 1 - (getOffset.width / screenWidth)
            return progress >= 0.9 ? progress : 0.9
        } else {
            return 1
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}
