//
//  Home.swift
//  SharedTabBar
//
//  Created by recherst on 2021/9/4.
//

import SwiftUI

struct Home: View {
    // Hide TabBar
    init() {
        UITabBar.appearance().isHidden = true
    }
    // SelectedTab
    @State var selectedTab = "SwiftUI"

    // For dark mode
    @Environment(\.colorScheme) var scheme

    var body: some View {
        ZStack(alignment: .bottom, content: {
            TabView(selection: $selectedTab) {
                Color.red
                    .tag("SwiftUI")
                    .ignoresSafeArea(.all, edges: .all)
                Color.blue
                    .tag("Beginners")
                    .ignoresSafeArea(.all, edges: .all)
                Color.yellow
                    .tag("macOS")
                    .ignoresSafeArea(.all, edges: .all)
                Color.pink
                    .tag("Contac")
                    .ignoresSafeArea(.all, edges: .all)
            }
            // Custom TabBar
            HStack(spacing: 0) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
                    .padding(.horizontal)

                TabBarButton(image: "swift", title: "SwiftUI", selectedTab: $selectedTab)
                TabBarButton(image: "book", title: "Beginners", selectedTab: $selectedTab)
                TabBarButton(image: "laptopcomputer", title: "macOS", selectedTab: $selectedTab)
                TabBarButton(image: "person.crop.circle.fill.badge.questionmark", title: "Contact", selectedTab: $selectedTab)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(scheme == .dark ? Color.black : Color.white)
        })
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    var rect: CGRect {
        return UIScreen.main.bounds
    }

    var safeAreaBottom: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10
    }
}
