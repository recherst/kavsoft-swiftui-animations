//
//  MainView.swift
//  CustomSideMenu
//
//  Created by recherst on 2021/8/10.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = "Home"
    @State var showMenu = false
    
    var body: some View {
        ZStack {
            Color("blue")
                .ignoresSafeArea()
            // Side menu
            SideMenu(selectedTab: $selectedTab)

            ZStack {
                // Two background cards
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical, 30)
                Home(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
            }
            // Scaling and moving the view
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? rect.width - 120 : 0)
            .ignoresSafeArea()
            .overlay(
                Button(action: {
                    withAnimation(.spring()) {
                        showMenu.toggle()
                    }
                }, label: {
                    Text("Button")
                })

                ,alignment: .topLeading
            )
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
