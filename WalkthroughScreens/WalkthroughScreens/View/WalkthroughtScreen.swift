//
//  WalkthroughtScreen.swift
//  WalkthroughScreens
//
//  Created by recherst on 2021/8/24.
//

import SwiftUI

struct WalkthroughtScreen: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        // For slide animation
        ZStack {
            if currentPage == 1 {
                ScreenView(image: "image1", title: "Step 1", detail: "", bgColor: Color("color1"))
                    .transition(.scale)
            }
            if currentPage == 2 {
                ScreenView(image: "image2", title: "Step 2", detail: "", bgColor: Color("color2"))
                    .transition(.scale)
            }
            if currentPage == 3 {
                ScreenView(image: "image3", title: "Step 3", detail: "", bgColor: Color("color3"))
                    .transition(.scale)
            }
        }
        .overlay(
            Button(action: {
                // Change views
                withAnimation(.easeInOut) {
                    currentPage += 1
//                    if currentPage < totalPage {
//
//                    }
//                    else {
//                        // For app testing only
//                        currentPage = 1
//                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)

                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPage))
                                .stroke(Color.white, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
            })
            .padding(.bottom, 20)

            , alignment: .bottom
        )
    }
}

struct WalkthroughtScreen_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughtScreen()
    }
}


var totalPage = 3
