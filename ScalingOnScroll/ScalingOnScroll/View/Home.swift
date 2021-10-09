//
//  Home.swift
//  ScalingOnScroll
//
//  Created by recherst on 2021/10/9.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Album Songs")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(
                Color.white
                    .shadow(color: Color.black.opacity(0.18), radius: 5, x: 0, y: 5)
            )
            .zIndex(0)
            // Move view in stack for shadow effect

            // Scaling effect
            GeometryReader { mainView in
                ScrollView {
                    VStack(spacing: 15) {
                        // Set name as id
                        ForEach(albums, id: \.albumName) { album in
                            // Album View
                            GeometryReader { item in
                                AlbumView(album: album)
                                    // Scaling effect from bottom
                                    .scaleEffect(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY), anchor: .bottom)
                                    // Add opacity effect
                                    .opacity(Double(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY)))

                            }
                            .frame(height: 100)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 25)
                }
                .zIndex(1)
            }
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
    }

    // Simple calculation for scaling effect
    func scaleValue(mainFrame: CGFloat, minY: CGFloat) -> CGFloat {
        // Add aniamtion
        withAnimation(.easeOut) {
            // Reduce top padding value
            let scale = (minY - 25) / mainFrame

            // Return scaling value to album view if its less than 1
            if scale > 1 {
                return 1
            } else {
                return scale
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
