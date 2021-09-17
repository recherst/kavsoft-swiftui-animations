//
//  TabBarButton.swift
//  CurvedTabbar
//
//  Created by recherst on 2021/9/17.
//

import SwiftUI

struct TabBarButton: View {
    @Binding var selected: String
    var value: String
    @Binding var centerX: CGFloat
    var rect: CGRect

    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = value
                centerX = rect.midX
            }
        }, label: {
            VStack {
                Image(systemName: value)
                    .resizable()
                    .frame(width: 26, height: 26)
                    .foregroundColor(selected == value ? Color("Color") : .gray)

                Text(value)
                    .font(.caption)
                    .foregroundColor(.black)
                    .opacity(selected == value ? 1 : 0)
            }
            // Default frame for reading mid x axis for curve
            .padding(.top)
            .frame(width: 70, height: 50)
            .offset(y: selected == value ? -15 : 0)
        })
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
