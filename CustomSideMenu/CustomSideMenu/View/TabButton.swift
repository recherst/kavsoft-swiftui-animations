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
        Button(action: {}, label: {
            HStack(spacing: 10, content: {
                Image(systemName: image)
                    .font(.title2)
                Text(title)
                    .fontWeight(.semibold)
            })
            .foregroundColor(selectedtab == title ? Color("blue") : .white)
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(
                Color.white
                    .opacity(selectedtab == title ? 1 : 0)
            )
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
