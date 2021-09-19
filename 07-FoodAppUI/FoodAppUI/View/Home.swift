//
//  Home.swift
//  FoodAppUI
//
//  Created by recherst on 2021/8/9.
//

import SwiftUI

struct Home: View {
    // Hiding tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    // Selected category
    @State var selectedCategory: Category = categories.first!
    @State var selectedTab: String = "home"
    var body: some View {
        VStack(spacing: 0) {
            // Tab view
            TabView {
                LandingPage(selectedCategory: $selectedCategory)
                    .tag("home")
                Color.pink
                    .tag("heart")
                Color.yellow
                    .tag("bell")
                Color.red
                    .tag("cart")
            }
            // Custom tab bar
            CustomeTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension View {
    var rect: CGRect {
        UIScreen.main.bounds
    }
}
