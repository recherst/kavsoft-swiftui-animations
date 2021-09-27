//
//  TabButton.swift
//  MessagingApp
//
//  Created by recherst on 2021/9/28.
//

import SwiftUI

struct TabButton: View {
    @Binding var selectedTab: String
    var title: String
    var animation: Namespace.ID

    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = title
            }
        }, label: {
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(
                    ZStack {
                        if selectedTab == title {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("top"))
                                .matchedGeometryEffect(id: "Tab", in: animation)
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
