//
//  HeaderView.swift
//  AnimatedStickyHeader
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var homeData: HomeViewModel
    @Environment(\.colorScheme) var scheme

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            HStack(spacing: 0) {
                Button(action: {}, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: size, height: size)
                        .foregroundColor(.primary)
                })

                Text("Kavsoft Backery")
                    .font(.title)
                    .fontWeight(.bold)
            }

            ZStack {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Asiatisch . Koreanisch . Japnisch")
                        .font(.caption)

                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.caption)

                        Text("30-40 Mins")
                            .font(.caption)

                        Text("4.3")
                            .font(.caption)

                        Image(systemName: "star.fill")
                            .font(.caption)

                        Text("$6.40 Fee")
                            .font(.caption)
                            .padding(.leading, 10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                })
                .opacity(homeData.offset > 200 ? 1 - Double((homeData.offset - 200) / 50) : 1)

                // Custom ScrollView
                // For Automatic scrolling
                ScrollViewReader { reader in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 0) {
                            ForEach(tabsItems) { tab in
                                Text(tab.tab)
                                    .font(.caption)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(
                                        Color.primary
                                            .opacity(homeData.selectedTab == tab.tab ? 1 : 0)
                                    )
                                    .clipShape(Capsule())
                                    .foregroundColor(homeData.selectedTab == tab.tab ? scheme == .dark ? .black : .white : .primary)
                                    .id(tab.tab)

                            }
                            .onChange(of: homeData.selectedTab, perform: { value in
                                withAnimation(.easeInOut) {
                                    reader.scrollTo(homeData.selectedTab, anchor: .leading)
                                }
                            })
                        }
                    })
                    // Visible only when scrolls up
                    .opacity(homeData.offset > 200 ? Double((homeData.offset - 200) / 50) : 0)
                }
            }
            // Default frame 60
            // Top frame = 40
            // So total = 100
            .frame(height: 60)

            if homeData.offset > 250 {
                Divider()
            }

        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(scheme == .dark ? Color.black : Color.white)
    }

    var size: CGFloat {
        if homeData.offset > 200 {
            let progress = (homeData.offset - 200) / 50
            if progress <= 1.0 {
                return progress * 40
            } else {
                return 40
            }
        } else {
            return 0
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
