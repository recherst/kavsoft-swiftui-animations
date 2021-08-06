//
//  Home.swift
//  SpotifyUI
//
//  Created by recherst on 2021/8/6.
//

import SwiftUI

struct Home: View {
    // Search text
   @State var searchText = ""
    var body: some View {
        HStack(spacing: 0) {
            // Side tab bar
            SideTabView()

            // Main content
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    HStack(spacing: 15) {
                        HStack(spacing: 15) {
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .frame(width: 25, height: 25)
                            TextField("Search...", text: $searchText)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.08))
                        .cornerRadius(8)

                        Button(action: {}, label: {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 45, height: 45)
                                .cornerRadius(10)
                        })
                    }

                    Text("Recently Played")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)

                    // Carousel list
                    TabView {
                        ForEach(recentlyPlayed) { item in
                            GeometryReader { geometry in
                                ZStack(alignment: .bottomLeading) {
                                    Image(item.albumCover)
                                        .resizable()
                                        // If you're using fill then you must specify the width
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.frame(in: .global).width)
                                        .cornerRadius(20)
                                    // Dark shading at button so that the data will be visible
                                        .overlay(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.clear, Color.clear,  Color.black]),
                                                startPoint: .top,
                                                endPoint: .bottom)
                                                .cornerRadius(20)
                                        )

                                    HStack(spacing: 15) {
                                        Button(action: {}, label: {
                                            Image(systemName: "play.fill")
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .padding(20)
                                                .background(Color("logoColor"))
                                                .clipShape(Circle())

                                        })

                                        VStack(alignment: .leading, content: {
                                            Text(item.albumName)
                                                .font(.title2)
                                                .fontWeight(.heavy)
                                                .foregroundColor(.white)

                                            Text(item.albumAuthor)
                                                .font(.none)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        })
                                    }
                                    .padding()
                                }
                            }
                            .padding(.horizontal)
                            .frame(height: 350)
                        }
                    }
                    .frame(height: 350)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top, 20)

                    Text("Genres")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)

                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 20, content: {
                        // List of genres
                        ForEach(generes, id: \.self) { genre in
                            Text(genre)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.06))
                                .clipShape(Capsule())
                        }
                    })
                    .padding(.top, 20)

                    Text("Liked Songs")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)

                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10, content: {
                        // Liked songs
                        ForEach(likeSongs.indices, id: \.self) { index in
                            GeometryReader { geometry in
                                Image(likeSongs[index].albumCover)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.frame(in: .global).width, height: 150)
                                    .clipShape(CustomCorners(corners: index % 2 == 0 ? [.topLeft, .bottomLeft] : [.topRight, .bottomRight], radius:  15))
                            }
                            .frame(height: 150)
                        }
                    })
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
        }
        .background(Color("bg").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


// Custom corner for single side corner image
struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
