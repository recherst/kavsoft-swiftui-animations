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
        // UITabBar is not available for macOS
        #if os(iOS)
        UITabBar.appearance().isHidden = true
        #endif
    }
    // SelectedTab
    @State var selectedTab = "SwiftUI"

    // For dark mode
    @Environment(\.colorScheme) var scheme

    var body: some View {
        ZStack(alignment: .bottom, content: {
            // Since TabBar hide option is not available so we can't use native TabBar in macOS
            #if os(iOS)
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
            #else
            ZStack {

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
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
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }

    var safeAreaBottom: CGFloat {
        #if os(iOS)
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10
        #else
        return 0
        #endif
    }

    // Get device type
    var device: Device {
        #if os(iOS)
        if UIDevice.current.model.contains("iPad") {
            return .iPad
        } else {
            return .iPhone
        }
        #else
        return .macOS
        #endif
    }
}

enum Device {
    case iPhone
    case iPad
    case macOS
}
