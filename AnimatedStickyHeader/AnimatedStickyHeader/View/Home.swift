//
//  Home.swift
//  AnimatedStickyHeader
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            // Since we're pinning header view
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {

                // Parallax header
                GeometryReader { reader in
                    Image("food")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 250)
                }
                .frame(height: 250)

                // Cards
                Section(header: HeaderView()) {
                    // Tabs with content
                    ForEach(tabsItems) { tab in
                        VStack(alignment: .leading, spacing: 15, content: {
                            Text(tab.tab)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.bottom)
                                .padding(.leading)

                            ForEach(tab.foods) { food in
                                CardView(food: food)
                            }

                            Divider()
                                .padding(.top)
                        })
                    }
                }
            })
        }
        .overlay(
            // Only Safe Area
            Color.white
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
            ,alignment: .top
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
