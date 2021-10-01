//
//  Home.swift
//  WheelPicker
//
//  Created by recherst on 2021/10/1.
//

import SwiftUI

struct Home: View {
    @State var circleWidth = UIScreen.main.bounds.width / 1.5
    @State var height = UIScreen.main.bounds.height
    @StateObject var homeData = HomeViewModel()

    var body: some View {
        ZStack {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)

            VStack {
                Spacer(minLength: 0)

                VStack {
                    HStack {
                        Option(image: "lock.rotation")

                        Spacer(minLength: 0)

                        Option(image: "bolt.fill")

                        Spacer(minLength: 0)

                        Option(image: "line.horizontal.3")
                    }
                    .padding()

                    HStack {
                        Button(action: {}, label: {
                            Image("profile")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                        })

                        Spacer(minLength: 0)

                        Button(action: {}, label: {
                            Image(systemName: "video.fill")
                                .font(.title2)
                                .foregroundColor(.black)
                                .frame(width: 65, height: 65)
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                // Since bottom edge is ignored
                .padding(.bottom, UIApplication.shared.windows.first!.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first!.safeAreaInsets.bottom)
                .background(Color.black.opacity(0.65))
                // Background  dim effect
                .overlay(Color.black.opacity(homeData.show ? 0.7 : 0))
            }

            // Wheel Picker
            ZStack {
                Circle()
                    // Top Cut
                    .trim(from: 0.5, to: 1)
                    .stroke(Color.white, lineWidth: 65)
                    .frame(width: circleWidth, height: circleWidth)
                    .opacity(homeData.show ? 1 : 0)

                // Camera
                Image(systemName: "camera.fill")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 65, height: 65)
                    .background(Color.white)
                    .clipShape(Circle())
                    // Animation
                    .offset(y: homeData.show ? 0 : -60)
                    .opacity(homeData.show ? 0 : 1)
                    // Add gesture
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged(homeData.onChanged(value:))
                            .onEnded(homeData.onEnded(value:))
                    )
                    // Bottom edge padding
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)

                // Adding function buttons
                ZStack {
                    FunctionButton(image: "face.dashed", angle: 20, current: $homeData.current, index: 1)

                    FunctionButton(image: "timer", angle: 50, current: $homeData.current, index: 2)

                    FunctionButton(image: "pano", angle: 90, current: $homeData.current, index: 3)

                    FunctionButton(image: "light.max", angle: 130, current: $homeData.current, index: 4)

                    FunctionButton(image: "gearshape.fill", angle: 160, current: $homeData.current, index: 5)
                }
                // Move all view to left
                // So angle will be perfect
                .opacity(homeData.show ? 1 : 0)
            }
            // Move view to bottom
            .offset(y: (height / 2) + 10)

            if homeData.getName() != "" && homeData.popup {
                Text(homeData.getName())
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 15)
                    .background(Color.black)
                    .cornerRadius(6)
            }
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
