//
//  HeaderView.swift
//  SquareWebUI
//
//  Created by recherst on 2021/8/29.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
            })

            Spacer()

            Button(action: {}, label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title2)
            })
        }
        .padding()
        .overlay(
            // Title
            Text("SquareSpace")
                .font(.title2)
                .fontWeight(.bold)
        )
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color("Color"))
        .foregroundColor(.white)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
