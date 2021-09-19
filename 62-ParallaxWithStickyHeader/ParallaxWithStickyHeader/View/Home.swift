//
//  Home.swift
//  ParallaxWithStickyHeader
//
//  Created by recherst on 2021/9/19.
//

import SwiftUI

struct Home: View {
    let maxHeight = UIScreen.main.bounds.height / 2.3
    @State var show = false

    // Row to grid animations
    @State var colums = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
            ScrollView(showsIndicators: false) {
                VStack {
                    // Parallax effect
                    GeometryReader { reader -> AnyView in
                        // Check if top scroll
                        let minY = reader.frame(in: .global).minY
                        let y = minY + maxHeight

                        if y < 0 {
                            // Toggle top sticky header
                            withAnimation(.linear) { show = true }
                        } else {
                            withAnimation(.linear) { show = false }
                        }

                        return AnyView(
                            Image("p10")
                                .resizable()
                                .frame(height: maxHeight)
                                // Avoid bottom scroll
                                .offset(y: -minY)
                        )
                    }
                    .frame(height: maxHeight)


                    LazyVGrid(columns: colums, spacing: 25, content: {
                        ForEach(albums, id: \.album_name) { album in
                            AlbumRow(album: album, colnums: $colums)
                        }
                    })
                    .padding()
                    .background(Color.black)
                    .cornerRadius(15)
                }
            }

            // Sticky header
            HStack(spacing: 15) {
                Image("p10")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .cornerRadius(15)

                VStack(alignment: .leading, spacing: 4, content: {
                    Text("Now Playing")
                        .font(.title2)
                        .fontWeight(.heavy)

                    Text("Lover - Taylor Swift")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                })

                Spacer(minLength: 0)

                // Buttons
                Button(action: {}, label: {
                    Image(systemName: "pause.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                })

                Button(action: {
                    if colums.count == 2 {
                        colums.removeLast()
                    } else {
                        colums.append(GridItem(.flexible(), spacing: 15))
                    }
                }, label: {
                    Image(systemName: colums.count == 2 ? "rectangle.grid.1x2" : "rectangle.3.offgrid")
                        .font(.title2)
                        .foregroundColor(.white)
                })
            }
            .padding([.horizontal, .bottom])
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(BlurView(style: .systemMaterialDark))
            .opacity(show ? 1 : 0)
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
