//
//  TabButton.swift
//  CourseAppUI
//
//  Created by recherst on 2021/10/13.
//

import SwiftUI

struct TabButton: View {
    var image: String
    @Binding var selectedTab: String
    var body: some View {
        Button(action: {
            selectedTab = image
        }, label: {
            Image(systemName: image)
                .font(.system(size: 22))
                .foregroundColor(selectedTab == image ? Color(UIColor.systemBlue) : Color.black.opacity(0.4))
                .padding()
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
