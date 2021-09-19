//
//  AlbumRow.swift
//  ParallaxWithStickyHeader
//
//  Created by recherst on 2021/9/19.
//

import SwiftUI

struct AlbumRow: View {
    var album: Album
    var body: some View {
        HStack(spacing: 15) {
            Image(album.album_cover)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 85, height: 85)
                .cornerRadius(15)

            VStack(alignment: .leading, spacing: 6, content: {
                Text(album.album_name)
                    .fontWeight(.heavy)

                Text(album.album_author)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            })

            Spacer(minLength: 0)

            // Menu button
            Button(action: {}, label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
            })
        }
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
