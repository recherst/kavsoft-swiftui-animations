//
//  SharedTabBarApp.swift
//  SharedTabBar
//
//  Created by recherst on 2021/9/4.
//

import SwiftUI

@main
struct SharedTabBarApp: App {
    var body: some Scene {
        // Hide window for only macOS
        #if os(iOS)
        WindowGroup {
            ContentView()
        }
        #else
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle())
        #endif
    }
}
