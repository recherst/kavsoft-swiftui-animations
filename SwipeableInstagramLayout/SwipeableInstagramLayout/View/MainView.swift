//
//  MainView.swift
//  SwipeableInstagramLayout
//
//  Created by recherst on 2021/8/27.
//

import SwiftUI

struct MainView: View {
    @State var offset: CGFloat = rect.width * 2
    var body: some View {
        // Scrollable Tabs...
        GeometryReader { reader in
            let frame = reader.frame(in: .global)
            // Since there are three views
            ScrollableTabBar(tabs: ["", "", ""], rect: frame, offset: $offset) {
                PostView(offset: $offset)

                Home(offset: $offset)

                DirectView(offset: $offset)
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
