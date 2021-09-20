//
//  TabBarButton.swift
//  SharedTabBar
//
//  Created by recherst on 2021/9/4.
//

import SwiftUI

struct TabBarButton: View {
    var image: String
    var title: String
    @Binding var selectedTab: String
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) { selectedTab = title }
        }, label: {
            VStack(spacing: 6) {
                Image(systemName: image)
                    .font(.system(size: device == .iPhone ? 30 : 25))
                    // For Dark mode adoption
                    .foregroundColor(selectedTab == title ? .white : .primary)

                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    // For Dark mode adoption
                    .foregroundColor(selectedTab == title ? .white : .primary)
            }
            .padding(.bottom, 8)
            // Total four tabs
            .frame(width: device == .iPhone ? (rect.width - 75) / 4 : 100, height: 55 + safeAreaBottom)
            .contentShape(Rectangle())
            // Bottom up effect
            .background(
                Color("purple")
                    .offset(
                        x: selectedTab == title ? 0 : device == .iPhone ? 0 : -100,
                        y: selectedTab == title ? 0 : device == .iPhone ? 100 : 0
                    )
            )
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
