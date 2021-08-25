//
//  Home.swift
//  AnimatedHeader
//
//  Created by recherst on 2021/8/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack(alignment: .top, content: {
            // Header view
            HeaderView()
                .zIndex(1)

            // Video view
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    ForEach(1...5, id: \.self) { index in
                        Image("thumb\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: rect.width - 30, height: 250)
                            .cornerRadius(1)

                        HStack(spacing: 10) {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())

                            VStack(alignment: .leading, spacing: 4, content: {
                                Text("New Sony Camera Unboxing and Review")
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                Text("iJustine . 4 hours ago")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            })
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 15)
                    }
                }
                .padding(.top, 75)
            })
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var edges = UIApplication.shared.windows.first?.safeAreaInsets
var rect = UIScreen.main.bounds
