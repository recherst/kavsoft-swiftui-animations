//
//  Home.swift
//  ScrollableTabBar
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    @State var offset: CGFloat = 0
    var body: some View {
        GeometryReader { reader in
            let rect = reader.frame(in: .global)

            ScrollableTabBar(tabs: tabs, rect: rect, offset: $offset) {
                HStack(spacing: 0) {
                    ForEach(image_URLs.indices, id: \.self) { index in
                        WebImage(url: URL(string: image_URLs[index]))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: rect.width)
                            // Again bug so use cornerRadius
                            .cornerRadius(0)

                    }
                }.ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var tabs = ["Home", "Search", "Account"]
