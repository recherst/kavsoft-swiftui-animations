//
//  TabBar.swift
//  AppleMusicAnimations
//
//  Created by recherst on 2021/9/14.
//

import SwiftUI

struct TabBar: View {
    // Selected tab index
    // Default is third
    @State var current = 2

    // Miniplayer properties
    @State var expand = false

    @Namespace var animation 

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $current) {
                Text("Library")
                    .tag(0)
                    .tabItem {
                        Image(systemName: "rectangle.stack.fill")
                        Text("Library")
                    }

                Text("Radio")
                    .tag(1)
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Radio")
                    }

                Search()
                    .tag(2)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }

            MiniPlayer(animation: animation, expand: $expand)
        })
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
