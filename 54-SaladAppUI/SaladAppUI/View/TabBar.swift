//
//  TabBar.swift
//  SaladAppUI
//
//  Created by recherst on 2021/9/15.
//

import SwiftUI

struct TabBar: View {
    @State var currentTab = "house"

    @Namespace var animation

    init() {
        UITabBar.appearance().isHidden = true
    }

    // Safe area values
    @State var safeArea = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $currentTab) {
                Home(animation: animation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[0])
                    .background(Color("bg").ignoresSafeArea())

                Text("Booking")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[1])
                    .background(Color("bg").ignoresSafeArea())

                Text("Favourites")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[2])
                    .background(Color("bg").ignoresSafeArea())

                Text("Settings")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[3])
                    .background(Color("bg").ignoresSafeArea())
            }

            // Custom Tab Bar
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image in
                    TabButton(image: image, selected: $currentTab, animation: animation)

                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 35)
            .padding(.top)
            .padding(.bottom, safeArea?.bottom != 0 ? safeArea?.bottom : 15)
            .background(
                LinearGradient(
                    gradient: .init(colors: [Color("g1"), Color("g2")]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .clipShape(CustomCorner(corners: [.topLeft, .topRight]))
            )
        })
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

var tabs = ["house", "book", "suit.heart", "person"]
