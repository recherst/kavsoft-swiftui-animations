//
//  CustomeTabBar.swift
//  FoodAppUI
//
//  Created by recherst on 2021/8/9.
//

import SwiftUI

struct CustomeTabBar: View {
    @Binding var selectedTab: String
    // Animation namespace for sliding effect
    @Namespace var animation
    var body: some View {
        HStack(spacing: 0) {
            // Tab Bar Button
            TabBarButton(animation: animation, image: "home", selectedTab: $selectedTab)
            TabBarButton(animation: animation, image: "heart", selectedTab: $selectedTab)

            Button(action: {}, label: {
                Image("search")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color("pink"))
                    .clipShape(Circle())
                // Shadows..
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
            })
            .offset(y: -30)

            TabBarButton(animation: animation, image: "bell", selectedTab: $selectedTab)
            TabBarButton(animation: animation, image: "cart", selectedTab: $selectedTab)
        }
        .padding(.top)
        // Decreasing the extra padding added
        .padding(.vertical, -10)
        .padding(.bottom, safeArea.bottom == 0 ? 15 : safeArea.bottom)
        .background(Color.white)
    }
}

struct CustomeTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extending view to get safe area..
extension View {
    var safeArea: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }
}

struct TabBarButton: View {
    var animation: Namespace.ID
    var image: String
    @Binding var selectedTab: String

    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = image
            }
        }, label: {
            VStack(spacing: 8) {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? Color("pink") : Color.gray.opacity(0.5))

                if selectedTab == image {
                    Circle()
                        .fill(Color("pink"))
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8, height: 8)
                }
            }
            .frame(maxWidth: .infinity)
        })
    }
}
