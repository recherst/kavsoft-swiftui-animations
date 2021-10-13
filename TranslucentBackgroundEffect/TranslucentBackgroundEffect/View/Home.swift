//
//  Home.swift
//  TranslucentBackgroundEffect
//
//  Created by recherst on 2021/10/13.
//

import SwiftUI

struct Home: View {
    @State var search = ""
    @State var index = 0

    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                // Blur the view
                .blur(radius: 35, opaque: true)

            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "ellipsis.circle")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                        })

                        Spacer()

                        Image("pic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    .padding(.all)

                    HStack {
                        Text("Find Your\nFavourite Clothes")
                            .font(.system(size: 30))
                            .foregroundColor(.black)

                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal)

                    HStack(spacing: 25) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 22))
                            .foregroundColor(.black)

                        VStack(alignment: .leading, content: {
                            TextField("Search", text: $search)

                            Divider()
                                .background(Color.black)
                        })
                    }
                    .padding(.vertical)
                    .padding(.horizontal)

                    HStack(spacing: 15) {
                        ForEach(0..<menu.count, id: \.self) { i in
                            Button(action: {
                                index = i
                            }, label: {
                                VStack(spacing: 8) {
                                    Text(menu[i])
                                        .foregroundColor(.black)
                                        .fontWeight(index == i ? .bold : .none)
                                        .font(.system(size: 14))

                                    Circle()
                                        .fill(Color.black)
                                        .frame(width: 6, height: 6)
                                        .opacity(index == i ? 1 : 0)
                                }
                                .padding(.vertical)
                            })
                        }
                    }
                    .padding(.top, 10)

                    // Row view
                    HStack(spacing: 15) {
                        VStack {
                            Image("p1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        // Padding 30 + spacing 15 = 45
                        .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 250)
                    }
                    .padding(.all)

                    Spacer()
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            })
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


var menu = ["New", "Popular", "Trending", "Highlights", "Medium"]
