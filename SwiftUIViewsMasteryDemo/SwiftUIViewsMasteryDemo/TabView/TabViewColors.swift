//
//  TabViewColors.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct TabViewColors: View {
    var body: some View {
        TabView {
            // Tab 1
            ZStack {
                Color.blue
                    .colorMultiply(.red)
                    .edgesIgnoringSafeArea(.top)
                VStack(spacing: 20) {
                    Text("TabView")
                        .font(.largeTitle)
                    Text("Tab Item Colors")
                        .font(.title)
                        .foregroundColor(.gray)
                    Text("set the color of the active tab item by setting the accent color for the TabView.")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(.title)
                        .background(Color.yellow)
                        .foregroundColor(Color.black)
                }
            }
            .tabItem {
                Image(systemName: "star.fill")
            }

            // tab 2
            Text("Second Screen")
                .tabItem {
                    Image(systemName: "moon.fill")
                }
                // Notice that I am setting the foreground color of the second tabItem
                // to red. This will have no effect on the color of the tab item.
                // The background modifier will not work either.
                .foregroundColor(Color.red)

            // tab 3
            Text("Third Screen")
                .tabItem {
                    Image(systemName: "sun.min.fill")
                }
        }
        .edgesIgnoringSafeArea(.top)
        // The only thing that works is to set the accent color on the TabView itself.
        .accentColor(.yellow)
    }
}

struct TabViewColors_Previews: PreviewProvider {
    static var previews: some View {
        TabViewColors()
            .preferredColorScheme(.dark)
    }
}
