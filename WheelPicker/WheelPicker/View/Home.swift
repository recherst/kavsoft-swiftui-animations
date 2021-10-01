//
//  Home.swift
//  WheelPicker
//
//  Created by recherst on 2021/10/1.
//

import SwiftUI

struct Home: View {
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
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color.black.opacity(0.65))
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
