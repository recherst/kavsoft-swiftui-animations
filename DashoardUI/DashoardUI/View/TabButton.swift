//
//  TabButton.swift
//  DashoardUI
//
//  Created by recherst on 2021/10/6.
//

import SwiftUI

struct TabButton: View {
    @Binding var selected: String
    var title: String
    var animation: Namespace.ID
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }, label: {
            ZStack {
                // Capsule and sliding effect
                Capsule()
                    .fill(Color.clear)
                    .frame(height: 45)

                if selected == title {
                    Capsule()
                        .fill(Color.white)
                        .frame(height: 45)
                        // Metched geometry effect
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }

                Text(title)
                    .foregroundColor(selected == title ? .black : .white)
                    .fontWeight(.bold)
            }
        })
    }
}

