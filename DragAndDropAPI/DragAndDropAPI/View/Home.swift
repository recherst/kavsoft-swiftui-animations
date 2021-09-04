//
//  Home.swift
//  DragAndDropAPI
//
//  Created by recherst on 2021/9/4.
//

import SwiftUI

struct Home: View {
    @StateObject var pageData = PageViewModel()
    // Slide animation
    @Namespace var animation
    var body: some View {
        VStack {
            // Custom Picker
            HStack {
                Image(systemName: "eyeglasses")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "private" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack {
                            if pageData.selectedTab != "private" {
                                Color.clear
                            } else {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation {
                            pageData.selectedTab = "private"
                        }
                    }

                Text("1")
                    .frame(width: 35, height: 35)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(pageData.selectedTab == "tabs" ? Color.black : Color.white, lineWidth: 3))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "tabs" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack {
                            if pageData.selectedTab != "tabs" {
                                Color.clear
                            } else {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation {
                            pageData.selectedTab = "tabs"
                        }
                    }

                Image(systemName: "laptopcomputer")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(pageData.selectedTab == "device" ? .black : .white)
                    .frame(width: 80, height: 45)
                    .background(
                        ZStack {
                            if pageData.selectedTab != "device" {
                                Color.clear
                            } else {
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "Tab", in: animation)
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation {
                            pageData.selectedTab = "device"
                        }
                    }
            }
            .background(Color.white.opacity(0.15))
            .cornerRadius(15)
            .padding(.top)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea(.all, edges: .all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
