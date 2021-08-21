//
//  Home.swift
//  AnimatedTabBar
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "house"
    var body: some View {
        ZStack(alignment: .bottom, content: {
            Color("TabBG")
                .ignoresSafeArea()

            // Custom tab bar
            CustomTabBar(selectedTab: $selectedTab)
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
