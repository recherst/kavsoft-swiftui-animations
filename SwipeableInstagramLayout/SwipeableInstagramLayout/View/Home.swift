//
//  Home.swift
//  SwipeableInstagramLayout
//
//  Created by recherst on 2021/8/27.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "house.fill"
    // To update for dark mode
    @Environment(\.colorScheme) var scheme

    @Binding var offset: CGFloat

    var body: some View {
        // Instagram home view
        TabView(selection: $selectedTab) {
            FeedView(offset: $offset)
                .tag("House.fill")
            Text("Search")
                .tag("magnifyingglass")
            Text("Reals")
                .tag("airplayvideo")
            Text("Liked")
                .tag("suit.heart.fill")
            Text("Account")
                .tag("person.circle")
        }
        .overlay(
            // Custom tab bar
            VStack(spacing: 12) {
                Divider()
                    .padding(.horizontal, -15)

                HStack(spacing: 0) {
                    TabBarButton(image: "house.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)

                    TabBarButton(image: "magnifyingglass", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)

                    TabBarButton(image: "airplayvideo", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)

                    TabBarButton(image: "suit.heart.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)

                    TabBarButton(image: "person.circle", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)

                }
            }
            .padding(.horizontal)
            .padding(.bottom, edges?.bottom ?? 15)
            .background(scheme == .dark ? Color.black : Color.white)

            , alignment: .bottom
        )
        .ignoresSafeArea()
    }
}

// Tab bar button
struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String

    var body: some View {
        Button(action: {
            selectedTab = image
        }, label: {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(selectedTab == image ? .primary : .gray)

        })
    }
}

var rect = UIScreen.main.bounds
var edges = UIApplication.shared.windows.first?.safeAreaInsets
