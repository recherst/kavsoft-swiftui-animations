//
//  SizeButton.swift
//  NikeApp
//
//  Created by recherst on 2021/10/3.
//

import SwiftUI

struct SizeButton: View {
    @Binding var size: Int
    var title: Int
    var black = Color.black.opacity(0.7)

    var body: some View {
        Button(action: {
            size = title
        }, label: {
            Text("\(title)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(size == title ? .white : black)
                .frame(width: 35, height: 35)
                .background(size == title ? Color("red") : Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
        })
    }
}
