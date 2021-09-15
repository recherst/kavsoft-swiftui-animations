//
//  TabButton.swift
//  SaladAppUI
//
//  Created by recherst on 2021/9/15.
//

import SwiftUI

struct TabButton: View {
    var image: String
    @Binding var selected: String

    var animation: Namespace.ID

    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = image
            }
        }, label: {
            VStack(spacing: 12) {
                Image(systemName: image)
                    .font(.system(size: 25))
                    .foregroundColor(selected == image ? .white : .gray)

                ZStack {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 8, height: 8)

                    if selected == image {
                        Circle()
                            .fill(Color.white)
                            // Smooth slide animation
                            .matchedGeometryEffect(id: "Tab", in: animation)
                            .frame(width: 8, height: 8)
                    }
                }
            }
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
