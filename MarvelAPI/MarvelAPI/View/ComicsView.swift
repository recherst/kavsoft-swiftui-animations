//
//  ComicsView.swift
//  MarvelAPI
//
//  Created by recherst on 2021/8/18.
//

import SwiftUI

struct ComicsView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                if homeData.fetchedComics.isEmpty {
                    ProgressView()
                        .padding(.top, 30)
                } else {
                    // Displaing content
                    VStack(spacing: 15) {
                        ForEach(homeData.fetchedComics) { comic in
                            ComicRowView(comic: comic)
                        }

                        if homeData.offset == homeData.fetchedComics.count {
                            // Show progress and fetch new data
                            ProgressView()
                                .padding(.vertical)
                                .onAppear(perform: {
                                    print("fetch new data...")
                                    homeData.fetchComics()
                                })
                        } else {
                            // Infinty scroll using geometry reader
                            GeometryReader { geometry -> Color in
                                let minY = geometry.frame(in: .global).minY

                                let height = UIScreen.main.bounds.height / 1.3

                                // When it goes over the height trigger update
                                if !homeData.fetchedComics.isEmpty && minY < height {
                                    DispatchQueue.main.async {
                                        // Set offset to current fetched comics count
                                        // So 0 will be now fetched from 20 and so on...
                                        homeData.offset = homeData.fetchedComics.count
                                    }
                                }

                                return Color.clear
                            }
                            .frame(width: 20, height: 20)
                        }
                    }
                    .padding(.vertical)
                }
            })
            .navigationTitle("Marvel's Comics")
        }
        .onAppear(perform: {
            if homeData.fetchedComics.isEmpty {
                homeData.fetchComics()
            }
        })
    }
}

struct ComicsView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView()
    }
}
