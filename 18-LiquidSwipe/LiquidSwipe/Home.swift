//
//  Home.swift
//  LiquidSwipe
//
//  Created by recherst on 2021/8/19.
//

import SwiftUI

struct Home: View {
    // Liquid swipe offset
    @State var offset: CGSize = .zero

    @State var showHome = false

    var body: some View {
        ZStack {
            Color("bg")
                // Give content before clipping
                .overlay(
                    // Content
                    VStack(alignment: .leading, spacing: 30, content: {
                        Text("From Gamers")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.")
                            .font(.caption)
                            .fontWeight(.bold)
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .offset(x: -15)
                )
                .clipShape(LiquidSwipe(offset: offset))
                .ignoresSafeArea()
                // arrow
                .overlay(
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        // For drag-gesture to identify
                        .frame(width: 50, height: 50)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    // Aniate swipe offset
                                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)) {
                                        offset = value.translation
                                    }
                                })
                                .onEnded({ value in
                                    let screen = UIScreen.main.bounds
                                    withAnimation(.spring()) {
                                        // Validating
                                        if -offset.width > screen.width / 2 {
                                            // Remove view
                                            offset.width = -screen.height
                                            showHome.toggle()
                                        } else {
                                            offset = .zero
                                        }
                                    }
                                })
                        )
                        .offset(x: 15, y: 58)
                        // Hide while draging start
                        .opacity(offset == .zero ? 1 : 0)

                    , alignment: .topTrailing
                )
                .padding(.trailing)

            if showHome {
                Text("Welcome To Home!!!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .onTapGesture {
                        // Reset view
                        // Just for tutorial
                        // Custimize for your own
                        withAnimation(.spring()) {
                            offset = .zero
                            showHome.toggle()
                        }
                    }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Custom Shape
struct LiquidSwipe: Shape {
    // Get offset value
    var offset: CGSize
    // Animating path
    var animatableData: CGSize.AnimatableData {
        get { return offset.animatableData }
        set { offset.animatableData = newValue }
    }
    func path(in rect: CGRect) -> Path {
        return Path { path in
            // When user moves left
            // Increase size both in top and bottom
            // So it will create a liquid swipe effect

            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            // First constructing rectangle shape
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            // Now constructing curve shape
            // From
            let from = 80 + offset.width
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))

            // Also add height
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to

            // Mid between 80 - 180
            let mid: CGFloat = 80 + ((to - 80) / 2)

            path.addCurve(
                to: CGPoint(x: rect.width, y: to),
                control1: CGPoint(x: width - 50, y: mid),
                control2: CGPoint(x: width - 50, y: mid)
            )
        }
    }
}
