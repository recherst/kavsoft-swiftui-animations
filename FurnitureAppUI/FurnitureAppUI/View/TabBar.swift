//
//  TabBar.swift
//  FurnitureAppUI
//
//  Created by recherst on 2021/9/19.
//

import SwiftUI

struct TabBar: View {
    @State var current = "Home"

    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $current) {
                Home()
                    .tag("Home")

                Text("Messages")
                    .tag("Messages")

                Text("Account")
                    .tag("Account")
            }

            HStack(spacing: 0) {
                TabButton(title: "Home", image: "house", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Messages", image: "message", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Account", image: "person", selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color("tab"))
            .clipShape(Capsule())
            .padding(.horizontal, 25)
        })
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
