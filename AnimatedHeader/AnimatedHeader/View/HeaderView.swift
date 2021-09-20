//
//  HeaderView.swift
//  AnimatedHeader
//
//  Created by recherst on 2021/8/25.
//

import SwiftUI

struct HeaderView: View {
    // for dark mode adoption
    @Environment(\.colorScheme) var scheme
    var body: some View {
        HStack(spacing: 20) {
            Image("youtube")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

            Text("YouTube")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                // Word spacing
                .kerning(0.5)
                .offset(x: -10)

            Spacer(minLength: 0)

            Button(action: {}, label: {
                Image(systemName: "display")
                    .font(.title2)
                    .foregroundColor(.primary)
            })

            Button(action: {}, label: {
                Image(systemName: "bell")
                    .font(.title2)
                    .foregroundColor(.primary)
            })

            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.primary)
            })

            Button(action: {}, label: {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(
            (scheme == .dark ? Color.black : Color.white)
                .ignoresSafeArea(.all, edges: .top)
        )
        // Divider
        .overlay(
            Divider()
            , alignment: .bottom
        )
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
