//
//  AlbumRow.swift
//  ParallaxWithStickyHeader
//
//  Created by recherst on 2021/9/19.
//

import SwiftUI

struct AlbumRow: View {
    var album: Album
    @Binding var colnums: [GridItem]
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(album.album_cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    // Padding = 30 + spacing 15 = 45
                    .frame(
                        width: colnums.count == 2 ? (UIScreen.main.bounds.width - 45) / 2 : 85,
                        height: colnums.count == 2 ? (UIScreen.main.bounds.width - 45) / 2 : 85)
                    .cornerRadius(15)

                if colnums.count == 1 {
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

            if colnums.count == 2 {
                HStack {
                    VStack(alignment: .leading, spacing: 6, content: {
                        Text(album.album_name)
                            .fontWeight(.heavy)

                        Text(album.album_author)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    })

                    Spacer(minLength: 15)

                    // Menu button
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    })
                }
            }
        }
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
