//
//  GenderButton.swift
//  NikeApp
//
//  Created by recherst on 2021/10/3.
//

import SwiftUI

struct GenderButton: View {
    @Binding var gender: String
    var title: String
    var black = Color.black.opacity(0.7)

    var body: some View {
        Button(action: {
            gender = title
        }, label: {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(gender == title ? .white : black)
                .padding(.vertical, 10)
                .frame(width: 80)
                .background(gender == title ? Color("red") : Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
        })
    }
}
