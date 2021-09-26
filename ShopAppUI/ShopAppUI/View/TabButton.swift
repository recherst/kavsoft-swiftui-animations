//
//  TabButton.swift
//  ShopAppUI
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI

struct TabButton: View {
    var title: String
    @Binding var selectedTab: String
    var animation: Namespace.ID
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = title
            }
        }, label: {
            VStack(alignment: .leading, spacing: 6, content: {
                Text(title)
                    .fontWeight(.heavy)
                    .foregroundColor(selectedTab == title ? .black : .gray)

                if selectedTab == title {
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 40, height: 4)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            })
            .frame(width: 100)
        })
    }
}
