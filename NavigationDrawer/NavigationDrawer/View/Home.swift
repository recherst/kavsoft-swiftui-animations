//
//  Home.swift
//  NavigationDrawer
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI

struct Home: View {
    init() {
        UITabBar.appearance().isHidden = true
    }

    @StateObject var menuData = MenuViewModel()

    @Namespace var animation

    var body: some View {
        HStack(spacing: 0) {
            // Drawer and main view

            // Drawer
            Drawer(animation: animation)

            // Main view
            TabView(selection: $menuData.selectedMenu) {
                Catalogue()
                    .tag("Catalogue")
                Orders()
                    .tag("Your Orders")

                Cart()
                    .tag("Your Cart")

                Favourites()
                    .tag("Favourites")

            }
            .frame(width: UIScreen.main.bounds.width)
        }
        // Max frame
        .frame(width: UIScreen.main.bounds.width)
        // 250 / 2 = 125 
        .offset(x: menuData.showDrawer ? 125 : -125)
        .overlay(
            ZStack {
                if !menuData.showDrawer {
                    DrawerCloseButton(animation: animation)
                        .padding()
                        .environmentObject(menuData)
                }
            }
            , alignment: .topLeading
        )
        // Set as environment object
        // For avoid re-declarations
        .environmentObject(menuData)

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
