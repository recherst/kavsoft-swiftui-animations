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

    var body: some View {
        VStack {
            VStack {
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
                    // Getting offset and moving the view
                    .offset(getOffset)

                    Spacer()
                }

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

            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    ForEach(friends) { friend in
                        FriendRowView(friend: friend)
                    }
                }
            })
            .padding(.top, 10)
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
                        print(offset)
                    }
                    return Color.clear
                }
                .frame(width: 0, height: 0)

                ,alignment: .top
            )
        }
    }

    var getOffset: CGSize {
        var size: CGSize = .zero
        size.width = offset
        size.height = -offset
        return size
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
