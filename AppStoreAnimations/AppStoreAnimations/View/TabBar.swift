//
//  TabBar.swift
//  AppStoreAnimations
//
//  Created by recherst on 2021/9/14.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Today()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                        .renderingMode(.template)
                    Text("Today")
                }

            Text("Games")
                .tabItem {
                    Image(systemName: "gamecontroller")
                        .renderingMode(.template)
                    Text("Games")
                }

            Text("Apps")
                .tabItem {
                    Image(systemName: "rectangle.stack")
                        .renderingMode(.template)
                    Text("Today")
                }

            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                    Text("Search")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
