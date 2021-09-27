//
//  TabButton.swift
//  CustomTabBar
//
//  Created by recherst on 2021/9/27.
//

import SwiftUI

struct TabButton: View {
    var title: String
    @Binding var selectedTab: String
    var animation: Namespace.ID

    var body: some View {
        Button(action: {
            withAnimation { selectedTab = title }
        }, label: {
            VStack(spacing: 6) {
                // Top indicator
                // Custom Shape

                // Slide in and out animation
                ZStack {
                    CustomShape()
                        .fill(Color.clear)
                        .frame(width: 45, height: 6)

                    if selectedTab == title {
                        CustomShape()
                            .fill(Color("tint"))
                            .frame(width: 45, height: 6)
                            .matchedGeometryEffect(id: "Tab_Change", in: animation)
                    }
                }
                .padding(.bottom, 10)

                Image(systemName: title)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(selectedTab == title ? Color("tint") : Color.black.opacity(0.2))

                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(selectedTab == title ? 0.6 : 0.2))
            }
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
