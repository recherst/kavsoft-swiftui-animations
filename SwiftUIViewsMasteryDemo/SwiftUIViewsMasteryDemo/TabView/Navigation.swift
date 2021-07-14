//
//  Navigation.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct Navigation: View {
    // set which tab is active
    @State private var selectedTab = 1
    var body: some View {
        // tell the tabview which variable to listen to for changes
        TabView(selection: $selectedTab) {
            // tab 1
            VStack(spacing: 20) {
                Text("TabView")
                    .font(.largeTitle)
                Text("Navigation")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("Add a unique tag value to each screen (view) you want to programmatically navigate to. You can then bind a variable to the TabView's selection property and change that variable to navigate.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title)
                    .background(Color.yellow)
                    .foregroundColor(Color.black)

                Button("Go To Tab 3") {
                    selectedTab = 3
                }
                .font(.title)
            }
            .tabItem {
                Image(systemName: "star.fill")
            }
            .tag(1)

            // tab 2
            Text("Second Screen")
                .tabItem {
                    Image(systemName: "moon.fill")
                }
                .tag(2)

            // Tab 3
            Text("Third Screen")
                .tabItem {
                    Image(systemName: "sun.min.fill")
                }
                .tag(3)
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
