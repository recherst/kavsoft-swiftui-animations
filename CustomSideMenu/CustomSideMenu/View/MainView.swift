//
//  MainView.swift
//  CustomSideMenu
//
//  Created by recherst on 2021/8/10.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = "Home"
    var body: some View {
        ZStack {
            Color("blue")
                .ignoresSafeArea()
            // Side menu
            SideMenu(selectedTab: $selectedTab)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// Extending view to get screen size
extension View {

    var rect: CGRect {
        UIScreen.main.bounds
    }
}
