//
//  CustomTabView.swift
//  CourseAppUI
//
//  Created by recherst on 2021/10/13.
//

import SwiftUI

struct CustomTabView: View {
    @State var selectedTab = "house"
    var edge = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {

            TabView(selection: $selectedTab) {
                Home()
                    .tag("house")

                Email()
                    .tag("mail")

                Folder()
                    .tag("folder")

                Settings()
                    .tag("gearshape")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)

            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image in
                    TabButton(image: image, selectedTab: $selectedTab)

                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal)
            .padding(.bottom, edge!.bottom == 0 ? 20 : 0)
        })
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(
            Color.black
                .opacity(0.05)
                .ignoresSafeArea()
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

var tabs = ["house", "mail", "folder", "gearshape"]
