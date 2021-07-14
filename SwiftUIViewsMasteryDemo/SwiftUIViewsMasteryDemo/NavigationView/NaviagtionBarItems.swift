//
//  NaviagtionBarItems.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/12.
//

import SwiftUI

struct NaviagtionBarItems: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Image(systemName: "blobe")
                    .font(.largeTitle)
                Text("NavigationView")
                Text("Navigation Bar Items")
                    .foregroundColor(.gray)
//                Image("NavBarItems")
                Text("You can add navigation bar buttons to the leading or trailing (or both ) sides of a navigation bar.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme3ForegroundColor"))
                    .foregroundColor(Color("Theme3BackgroundColor"))

                Text("Use the accentColor modifier on the navigation bar items to change them from the default accent color.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme3ForegroundColor"))
                    .foregroundColor(Color("Theme3BackgroundColor"))
            }
            .font(.title)
            .padding(.top, 25)
            .navigationBarTitle(Text("Navigation Bar Items"), displayMode: .inline)
            // Add some bar items to the nav bar
            .navigationBarItems(
                // Button on the leading side
                leading: Button(action: {}) {
                    Image(systemName: "bell.fill")
                }.accentColor(.pink),
                // Button on the trailing side
                trailing: Button("Actions", action: {

                }).accentColor(.pink)
            )
        }
    }
}

struct NaviagtionBarItems_Previews: PreviewProvider {
    static var previews: some View {
        NaviagtionBarItems()
    }
}
