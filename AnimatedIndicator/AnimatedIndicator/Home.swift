//
//  Home.swift
//  AnimatedIndicator
//
//  Created by recherst on 2021/8/18.
//

import SwiftUI

struct Home: View {
    // Colors as Tabs
    // Use your own tabs here
    var colors: [Color] = [.red, .blue, .pink, .purple]
    // Offset
    @State var offset: CGFloat = 0

    var body: some View {
        // TabView has problem in ignoring top edge
        // Fix use scrollView
        ScrollView(.init()) {
            TabView {
                ForEach(colors.indices, id: \.self) { index in
                    if index == 0 {
                        colors[index]
                            .overlay(
                                // Geometry Reader for getting offset
                                GeometryReader { geometry -> Color in
                                    let minX = geometry.frame(in: .global).minX
                                    print("minX --  \(minX)")
                                    DispatchQueue.main.async {
                                        withAnimation(.default) {
                                            self.offset = -minX
                                        }
                                    }
                                    return Color.clear
                                }
                                .frame(width: getWidth, height: UIScreen.main.bounds.height)

                                , alignment: .leading
                            )
                    } else {
                        colors[index]
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                // Animated Indicators
                HStack(spacing: 15) {
                    ForEach(colors.indices, id: \.self) { index in
                        Capsule()
                            .fill(Color.white)
                            .frame(width: getIndex == index ? 20 : 7, height: 7)
                    }
                }
                // Smooth sliding effect
                .overlay(
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 20, height: 7)
                        .offset(x: getOffset)

                    , alignment: .leading
                )
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .padding(.bottom, 10)

                , alignment: .bottom
            )
        }
        .ignoresSafeArea()
    }

    // get index
    var getIndex: Int {
        let index = Int(round(Double(offset / getWidth)))
        print("index ---  \(index)")
        return index
    }

    // Get offset for capsule shape
    var getOffset: CGFloat {
        // Spacing = 15
        // Circle width = 7
        // so Total = 22
        let progress = offset / getWidth

        return 22 * progress
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


// Extending view to get width
extension View {
    var getWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}
