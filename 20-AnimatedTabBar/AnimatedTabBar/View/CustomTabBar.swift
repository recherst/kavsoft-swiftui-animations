//
//  CustomTabBar.swift
//  AnimatedTabBar
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String

    // Store each tab midpoints to animate it in future
    @State var tabPoints: [CGFloat] = []

    var body: some View {
        HStack(spacing: 0) {
            // Tab Bar Buttons
            TabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "bookmark", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "message", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
        }
        .padding()
        .background(
            Color.white
                .clipShape(TabCurve(tabPoint: curvePoint - 15))
        )
        .overlay(
            Circle()
                .fill(Color.white)
                .frame(width: 10, height: 10)
                .offset(x: curvePoint - 20)
            , alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }

    var curvePoint: CGFloat {
        // if tabpoint is empty
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "house":
                return tabPoints[0]
            case "bookmark":
                return tabPoints[1]
            case "message":
                return tabPoints[2]
            default:
                return tabPoints[3]
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String

    @Binding var tabPoints: [CGFloat]

    var body: some View {
        // For getting mid point of each button for curve animation
        GeometryReader { reader -> AnyView in
            // Extract midpoint and store
            let midX = reader.frame(in: .global).midX

            DispatchQueue.main.async {
                // Avoid junk data
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            return AnyView(
                Button(action: {
                    // Change tab
                    // Spring animation
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = image
                    }
                }, label: {
                    // Fill the color if it' selected
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("TabSelected"))
                        // Lift view
                        // If its selected
                        .offset(y: selectedTab == image ? -10 : 0)
                })
                // Max frame
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        .frame(height: 50)
    }
}
