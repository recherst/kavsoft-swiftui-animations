//
//  ContentView.swift
//  ScrollToTop
//
//  Created by 刘勇刚 on 2021/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Medium")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    @State var scrollViewOffset: CGFloat = 0
    @State var startOffset: CGFloat = 0
    @State var isScrollToTop = false

    var body: some View {

        ScrollViewReader { reader in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 25) {
                    ForEach(1...30, id: \.self) { index in
                        // Sample Row View
                        HStack(spacing: 15) {
                            Circle()
                                .fill(Color.gray.opacity(0.5))
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading, spacing: 8, content: {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.gray.opacity(0.5))
                                    .frame(height: 22)

                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.gray.opacity(0.5))
                                    .frame(height: 22)
                                    .padding(.trailing, 100)

                            })
                        }
                    }
                }
                .padding()
                .id("SCROLL_TO_TOP")
                // getting ScrollView offset...
                .overlay(
                    // using Geometry Reader to get ScrollView offset...
                    GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            if startOffset == 0 {
                                startOffset = proxy.frame(in: .global).minY
                            }
                            let offset = proxy.frame(in: .global).minY
                            scrollViewOffset = offset - startOffset
                            print(scrollViewOffset)
                        }
                        return Color.clear
                    }
                    .frame(width: 0, height: 0)

                    ,alignment: .top
                )
            }
            .overlay(
                Button(action: {
                    withAnimation(Animation.linear(duration: 0.3)) {
                        isScrollToTop = true
                        reader.scrollTo("SCROLL_TO_TOP", anchor: .top)
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isScrollToTop = false
                    }
                }, label: {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                        .background(Color("red"))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
                })
                .buttonStyle(BorderlessButtonStyle())
                .padding(.trailing)
                .padding(.bottom, getSafeArea().bottom == 0 ? 12 : 0)
                .opacity(-scrollViewOffset > 450 ? 1 : 0)
                .animation(.easeInOut)
                .disabled(isScrollToTop)

                ,alignment: .bottomTrailing
            )
        }
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
    }
}
