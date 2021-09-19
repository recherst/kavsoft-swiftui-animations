//
//  Home.swift
//  AnimatedHeader
//
//  Created by recherst on 2021/8/25.
//

import SwiftUI

struct Home: View {
    @StateObject var headerData = HeaderViewModel()
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        ZStack(alignment: .top, content: {
            // Header view
            HeaderView()
                .zIndex(1)
                .offset(y: headerData.headerOffset)

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
                .overlay(
                    // Geometry reader for getting offset value
                    GeometryReader { reader -> Color in
                        let minY = reader.frame(in: .global).minY
                        DispatchQueue.main.async {
                            // Store initial MinY value
                            if headerData.startMinY == 0 {
                                headerData.startMinY = minY
                            }
                            // Get exact offset value by subtracting current from start
                            let offset = headerData.startMinY - minY

                            if offset > headerData.offset {
                                print("Top")
                                // Same clear bottom offset
                                headerData.bottomScrollOffset = 0
                                // If top, hide header view
                                if headerData.topScrollOffset == 0 {
                                    // Store initially to subtract the maxOffset
                                    headerData.topScrollOffset = offset
                                }

                                let progress = (headerData.topScrollOffset + maxOffset) - offset
                                // All conditions were going to use ternary operator
                                // becuase if we use if else while swiping fast it ignore some conditions
                                let offsetCondition = (headerData.topScrollOffset + maxOffset) >= maxOffset && maxOffset - progress <= maxOffset

                               let headerOffset = offsetCondition ? -(maxOffset - progress) : -maxOffset
                                print(headerOffset)
                                headerData.headerOffset = headerOffset
                            }

                            if offset < headerData.offset {
                                print("Bottom")
                                // If bottom, revelating header view
                                // Clear topScrollValue and set bottom
                                headerData.topScrollOffset = 0
                                if headerData.bottomScrollOffset == 0 {
                                    headerData.bottomScrollOffset = offset
                                }

                                // Move if little bit of screen is swiped down for eg 40 offset
                                withAnimation(.easeOut(duration: 0.25)) {
                                    let headerOffset = headerData.headerOffset
                                    headerData.headerOffset = headerData.bottomScrollOffset >= offset + 40 ? 0 : (headerOffset != maxOffset ? 0 : -headerOffset)
                                }
                            }

                            headerData.offset = offset
                        }
                        return Color.clear
                    }
                    .frame(height: 0)

                    , alignment: .top
                )
            })
        })
    }

    var maxOffset: CGFloat {
        headerData.startMinY + (edges?.top ?? 0) + 10
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var edges = UIApplication.shared.windows.first?.safeAreaInsets
var rect = UIScreen.main.bounds
