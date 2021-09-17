//
//  Home.swift
//  CurvedTabbar
//
//  Created by recherst on 2021/9/17.
//

import SwiftUI

struct Home: View {
    @State var selected = "house"

    init() {
        UITabBar.appearance().isHidden = true
    }

    @State var centerX: CGFloat = 0

    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selected) {
                Color.red
                    .tag(tabItems[0])
                    .ignoresSafeArea(.all, edges: .top)

                Color.blue
                    .tag(tabItems[1])
                    .ignoresSafeArea(.all, edges: .top)

                Color.black
                    .tag(tabItems[2])
                    .ignoresSafeArea(.all, edges: .top)

                Color.yellow
                    .tag(tabItems[3])
                    .ignoresSafeArea(.all, edges: .top)
            }

            // Custom TabBar
            HStack(spacing: 0) {
                ForEach(tabItems, id: \.self) { tab in
                    GeometryReader { reader in
                        TabBarButton(selected: $selected, value: tab, centerX: $centerX, rect: reader.frame(in: .global))
                        // Setting first initial curve
                            .onAppear(perform: {
                                if tab == tabItems.first {
                                    centerX = reader.frame(in: .global).midX
                                }
                            })
                    }
                    .frame(width: 70, height: 50)

                    if tab != tabItems.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.top)
            // For smaller size iPhone padding will be 15 and for notch phones no padding
            .padding(.bottom, bottom == 0 ? 15 : bottom)
            .background(Color.white.clipShape(AnimatedShape(centerX: centerX)))
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            .padding(.top, -15)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
