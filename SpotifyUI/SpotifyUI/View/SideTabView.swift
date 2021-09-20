//
//  SideTabView.swift
//  SpotifyUI
//
//  Created by recherst on 2021/8/6.
//

import SwiftUI

struct SideTabView: View {
    @State var selectedTab = "house.fill"
    @State var volume: CGFloat = 0.4
    @State var showSideBar = false

    var body: some View {
        VStack {
            Image("spotify")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 45, height: 45)
                .padding(.top)

            VStack {
                TabButton(image: "house.fill", selectedTab: $selectedTab)

                TabButton(image: "safari.fill", selectedTab: $selectedTab)

                TabButton(image: "mic.fill", selectedTab: $selectedTab)

                TabButton(image: "clock.fill", selectedTab: $selectedTab)
            }
            // Setting the tabs for half of the height so that
            // remaining elements will get space
            .frame(height: rect.height / 2.3)
            .padding(.top)

            Spacer(minLength: rect.height < 750 ? 30 : 50)

            Button(action: {
                // Checking and increasing volume
                volume = volume + 0.1 < 1.0 ? volume + 0.1 : 1
            }, label: {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            // Custom volume progress view
            GeometryReader { geometry in
                // Extracting progress bar height and based on
                // that getting progress value...
                let height: CGFloat = geometry.frame(in: .global).height
                let progress = height * volume

                ZStack(alignment: .bottom) {
                    Capsule()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 4)
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 4, height: progress)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            .padding(.vertical, rect.height < 750 ? 10 : 20)

            Button(action: {
                // Checking and decreasing volume
                volume = volume - 0.1 > 0 ? volume - 0.1 : 0
            }, label: {
                Image(systemName: "speaker.wave.1.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            Button(action: {
                withAnimation(.easeIn) {
                    showSideBar.toggle()
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(.white)
                    // Rotating
                    .rotationEffect(Angle(degrees: showSideBar ? -180 : 0))
                    .padding()
                    .background(Color.black)
                    .shadow(radius: 5)
            })
            .padding(.top, rect.height < 750 ? 15 : 30)
            .padding(.bottom, safeArea.bottom == 0 ? 15 : 0)
            .offset(x: showSideBar ? 0 : 100)
        }
        // Max side tab bar width
        .frame(width: 80)
        .background(Color.black.ignoresSafeArea())
        .offset(x: showSideBar ? 0 : -100)
        // Reclaiming the spacing by using negative spacing
        // If you want to move the view along with tab bar
        .padding(.trailing, showSideBar ? 0 : -100)
        .zIndex(1)
    }
}

struct SideTabView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct TabButton: View {
    var image: String
    @Binding var selectedTab: String
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(selectedTab == image ? .white : Color.gray.opacity(0.6))
                .frame(maxHeight: .infinity)
        })
    }
}

// Extending View to get screen size
extension View {
    var rect: CGRect {
        UIScreen.main.bounds
    }

    var safeArea: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }
}
