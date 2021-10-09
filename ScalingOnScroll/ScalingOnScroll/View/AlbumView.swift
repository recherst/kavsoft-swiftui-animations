//
//  AlbumView.swift
//  ScalingOnScroll
//
//  Created by recherst on 2021/10/9.
//

import SwiftUI

struct AlbumView: View {
    var album: Album
    var body: some View {
        HStack {
            Image(album.albumCover)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(15)

            VStack(alignment: .leading, spacing: 12, content: {
                Text(album.albumName)
                    .fontWeight(.bold)

                Text(album.albumAuthor)
            })
            .padding(.leading, 10)

            Spacer(minLength: 0)
        }
        .background(Color.white.shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 4))
        .cornerRadius(15)
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
