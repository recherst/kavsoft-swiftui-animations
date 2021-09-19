//
//  TabBar.swift
//  AppStoreAnimations
//
//  Created by recherst on 2021/9/14.
//

import SwiftUI

struct TabBar: View {
    @Namespace var animation

    @StateObject var detailObject = DetailViewModel()
    
    var body: some View {
        ZStack {
            TabView {
                Today(animation: animation)
                    .environmentObject(detailObject)
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
            // Hide TabBar when detail page opens
            .opacity(detailObject.show ? 0 : 1)

            if detailObject.show {

                Detail(detail: detailObject, animation: animation)
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
