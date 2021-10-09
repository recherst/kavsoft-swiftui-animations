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

            ScrollView {
                VStack(spacing: 15) {
                    // Set name as id
                    ForEach(albums, id: \.albumName) { album in
                        // Album View
                    }
                }
            }
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
