//
//  MainView.swift
//  CustomSideMenu
//
//  Created by recherst on 2021/8/10.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = "Home"
    // Animation Namespace
    @Namespace var animation
    var body: some View {
        ZStack {
            Color("blue")
                .ignoresSafeArea()

            // Side menu
            VStack(alignment: .leading, spacing: 15, content: {
                // Profile Pic
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    // Padding top for top close button
                    .padding(.top, 50)

                VStack(alignment: .leading, spacing: 6, content: {
                    Text("Jenna Ezarik")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)

                    Button(action: {}, label: {
                        Text("View Profile")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .opacity(0.7)
                    })
                })

                // Tab buttons
                VStack(spacing: 0) {
                    TabButton(image: "house", title: "Home", selectedtab: $selectedTab, animation: animation)
                }
                .padding(.leading, -15)
                .padding(.top, 50)
            })
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
