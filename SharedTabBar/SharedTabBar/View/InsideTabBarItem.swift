//
//  InsideTabBarItem.swift
//  SharedTabBar
//
//  Created by recherst on 2021/9/4.
//

import SwiftUI

// Separate TabBar items for ease of using
struct InsideTabBarItem: View {
    @Binding var selectedTab: String
    var body: some View {
        Group {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
                .padding(.horizontal)
                .padding(.top, device == .iPhone ? 0 : 35)
                .padding(.bottom, device == .iPhone ? 0 : 15)

            TabBarButton(image: "swift", title: "SwiftUI", selectedTab: $selectedTab)
            TabBarButton(image: "book", title: "Beginners", selectedTab: $selectedTab)
            TabBarButton(image: "laptopcomputer", title: "macOS", selectedTab: $selectedTab)
            TabBarButton(image: "person.crop.circle.fill.badge.questionmark", title: "Contact", selectedTab: $selectedTab)
        }
    }
}

struct InsideTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
