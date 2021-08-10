//
//  TabButton.swift
//  CustomSideMenu
//
//  Created by recherst on 2021/8/10.
//

import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    @Binding var selectedtab: String
    // For hero animation slide
    var animation: Namespace.ID
    var body: some View {
        Button(action: {
            withAnimation(.spring()) { selectedtab = title }
        }, label: {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedtab == title ? Color("blue") : .white)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            // Max Frame
            .frame(maxWidth: rect.width - 170, alignment: .leading)
            .background(
                ZStack {
                    if selectedtab == title {
                        Color.white
                            .opacity(selectedtab == title ? 1 : 0)
                            .clipShape(
                                CustomCorners(
                                    corners: [.topRight, .bottomRight],
                                    radius: 10
                                )
                            )
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            )
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
