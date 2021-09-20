//
//  Home.swift
//  VerticalPageTabView
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

struct Home: View {
    @State var currentPage: Int = 1
    // Page tab bar has a bug that i bounces
    // But we have solution for it
    // But is disables all scroll bounces in whole app
    // Hope SwiftUI 3.0 will solve this
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        // Page tab view again has a bug that doesn't ignore top edge
        // But we have solution for that
        ScrollView(.init()) {
            TabView {
                GeometryReader { reader in
                    let screen = reader.frame(in: .global)

                    // Over sliding animation
                    let offset = screen.minX
                    let scale = 1 + (offset / screen.width)

                    TabView(selection: $currentPage) {
                        ForEach(1...5, id: \.self) { index in
                            Image("img\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(1)
                                .modifier(VerticalTabBarModifier(screen: screen))
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    // Vertical tab bar
                    .rotationEffect(.init(degrees: 90))
                    // Adjust width
                    .frame(width: screen.width)
                    // limit scale
                    .scaleEffect(scale >= 0.88 ? scale : 0.88, anchor: .center)
                    // Over sliding effect
                    .offset(x: -offset)
                    // Blur effect
                    .blur(radius: (1 - scale) * 20)
                }

                DetailView(currentPage: $currentPage)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .background(Color.black.ignoresSafeArea())
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension View {
    var rect: CGRect {
        UIScreen.main.bounds
    }
}

struct DetailView: View {
    @Binding var currentPage: Int
    var body: some View {
        VStack(spacing: 20) {
            Text("Details")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, edges?.top ?? 15)

            Image("img\(currentPage)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .cornerRadius(20)
                .padding(.vertical)

            VStack(alignment: .leading, spacing: 10, content: {
                Text("Dark Soul")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("By iJustine")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)

            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)

            // Buttons
            Button(action: {}, label: {
                Text("Download Image")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 1.5)
                    )
            })
            .padding(.vertical)

            Button(action: {}, label: {
                Text("Report Image")
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.red, lineWidth: 1.5)
                    )
            })

            Spacer()
        }
        .padding()
        .background(Color("slider").ignoresSafeArea())
    }
}

struct VerticalTabBarModifier: ViewModifier {
    var screen: CGRect
    func body(content: Content) -> some View {
        return content
            // Before rotation frame
            .frame(width: screen.width, height: screen.height)
            // Rerotate views to -90 so that it will act as vertical carousel
            .rotationEffect(.init(degrees: -90))
            // After rotation frame
            .frame(width: screen.height, height: screen.width)
    }
}


var edges = UIApplication.shared.windows.first?.safeAreaInsets
