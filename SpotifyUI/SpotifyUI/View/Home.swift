//
//  Home.swift
//  SpotifyUI
//
//  Created by recherst on 2021/8/6.
//

import SwiftUI

struct Home: View {
   
    var body: some View {
        HStack(spacing: 0) {
            // Side tab bar
            SideTabView()

            // Main content
            ScrollView(showsIndicators: false) {

            }
        }
        .background(Color("bg").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
