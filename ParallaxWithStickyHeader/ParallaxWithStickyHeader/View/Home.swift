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
                            show = true
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


                    VStack(spacing: 0) {
                        ForEach(albums, id: \.album_name) { album in
                            AlbumRow(album: album)
                        }
                        .padding()
                    }
                    .background(Color.black)
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
            }
            .padding([.horizontal, .bottom])
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
