//
//  TabViewIntroduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct TabViewIntroduction: View {
    var body: some View {
        TabView {
            // first screen
            VStack(spacing: 20) {
                Text("TabView")
                    .font(.largeTitle)
                Text("Introduction")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("The TabView view can hold multiple views, one for each tab.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title)
                    .background(Color.yellow)
                    .foregroundColor(.black)

                Text("At the end of a view, you add .tabItem modifier to show a button that allows navigation to that view.")
                    .font(.title)

                Image("TabItem")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 80, height: 80)
            }
            .tabItem {
                // creates the tab button in tab bar
                Text("Tab 1")
            }

            // second screen
            Text("This view represents the Second Screen.")
                .tabItem {
                    // creates the tab button in tab bar
                    Text("Tab 2")
                }
        }
    }
}

struct TabViewIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        TabViewIntroduction()
            .preferredColorScheme(.dark)
    }
}
