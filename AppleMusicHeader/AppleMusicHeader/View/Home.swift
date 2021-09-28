//
//  Home.swift
//  AppleMusicHeader
//
//  Created by recherst on 2021/9/28.
//

import SwiftUI

struct Home: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var opacity: Double = 0

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {

            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    // First parallax scroll
                    GeometryReader { reader in
                        let minY = reader.frame(in: .global).minY

                        VStack {
                            Image("p1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: minY > 0 ? minY + UIScreen.main.bounds.height / 2.2 : UIScreen.main.bounds.height / 2.2)
                                .offset(y: -minY)
                                .onChange(of: minY, perform: { value in
                                    // Check if  top is reached
                                    let offset = value + UIScreen.main.bounds.height / 2.2
                                    if offset < 80 {
                                        // Range from 0 - 80
                                        if offset > 0 {
                                            // Calculate opacity
                                            let opacityValue = (80 - offset) / 80
                                            self.opacity = Double(opacityValue)
                                            return
                                        }
                                        // Else means full opacity
                                        self.opacity = 1
                                    } else {
                                        self.opacity = 0
                                    }
                                })
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)

                    // List of songs
                    VStack(spacing: 10) {
                        ForEach(albums, id: \.albumName) { album in
                            HStack(spacing: 15) {
                                Image("\(album.albumCover)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 55, height: 55)
                                    .cornerRadius(15)

                                VStack(alignment: .leading, spacing: 5, content: {
                                    Text("\(album.albumName)")
                                    Text("\(album.albumAuthor)")
                                        .font(.caption)
                                })

                                Spacer(minLength: 0)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                    .background(Color.white)
                }
            })

            VStack(spacing: 0) {
                HStack {
                    Button(action: {}, label: {
                        HStack(spacing: 8) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 22, weight: .bold))

                            Text("Search")
                        }
                    })

                    Spacer(minLength: 0)

                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .frame(width: 22, height: 22)
                            .rotationEffect(.init(degrees: 90))
                    })
                }
                .padding()
                .foregroundColor(opacity > 0.6 ? .black : .white)
                // Since top edge is ignored
                .padding(.top, edges!.top)
                .background(Color.white.opacity(opacity))
                .shadow(color: Color.black.opacity(opacity > 0.8 ? 0.1 : 0), radius: 5, x: 0, y: 5)

                Spacer()
            }
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
