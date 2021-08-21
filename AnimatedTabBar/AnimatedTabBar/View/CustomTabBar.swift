//
//  CustomTabBar.swift
//  AnimatedTabBar
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String

    var body: some View {
        HStack(spacing: 0) {
            // Tab Bar Buttons
            TabBarButton(image: "house", selectedTab: $selectedTab)
            TabBarButton(image: "bookmark", selectedTab: $selectedTab)
            TabBarButton(image: "message", selectedTab: $selectedTab)
            TabBarButton(image: "person", selectedTab: $selectedTab)
            
        }
        .padding()
        .background(
            Color.white
                .clipShape(TabCurve())
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String

    var body: some View {
        // For getting mid point of each button for curve animation
        GeometryReader { reader in
            Button(action: {
                withAnimation {
                    selectedTab = image
                }
            }, label: {
                // Fill the color if it' selected
                Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(Color("TabSelected"))
                    // Lift view
                    // If its selected
                    .offset(y: selectedTab == image ? -10 : 0)
            })
            // Max frame
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 50)
    }
}
