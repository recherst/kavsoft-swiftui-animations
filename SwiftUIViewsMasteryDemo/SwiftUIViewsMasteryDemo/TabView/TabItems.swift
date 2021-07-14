//
//  TabItems.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct TabItems: View {
    var body: some View {
        TabView {
            TabOne()
                .tabItem {
                    Text("Tab Text")
                }
            Text("Phone Calls")
                .tabItem {
                    Image(systemName: "phone")
                }
            Text("Outgoing Phone Calls")
                .tabItem {
                    Image(systemName: "phone.arrow.up.right")
                    Text("Outgoing")
                }
        }
    }
}

struct TabOne: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("TabView")
                .font(.largeTitle)
            Text("TabItems")
                .font(.title)
                .foregroundColor(.gray)
            Text("TabItems can accept Text, Image or both. Notcie the order of Text and Image does not matter for the tabItems.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.yellow)
                .foregroundColor(.black)
        }
    }
}

struct TabItems_Previews: PreviewProvider {
    static var previews: some View {
        TabItems()
            .preferredColorScheme(.dark)
    }
}
