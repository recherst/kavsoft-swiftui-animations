//
//  CharacterRowView.swift
//  MarvelAPI
//
//  Created by recherst on 2021/8/17.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterRowView: View {
    var character: Character
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            WebImage(url: extractImage(data: character.thumbnail))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8, content: {
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.bold)

                Text(character.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)

                // Links
                HStack(spacing: 10) {
                    ForEach(character.urls, id: \.self) { url in
                        NavigationLink(
                            destination: WebView(url: extractURL(data: url))
                                .navigationTitle(extractURLType(data: url)),
                            label: {
                                Text(extractURLType(data: url))
                            })
                    }
                }
            })

            Spacer(minLength: 0)
        }
        .padding(.horizontal)
    }

    func extractImage(data: [String: String]) -> URL {
        // Combine both and form image
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")!
    }

    func extractURL(data: [String: String]) -> URL {
        let url = data["url"] ?? ""
        return URL(string: url)!
    }

    func extractURLType(data: [String: String]) -> String {
        let type = data["type"] ?? ""
        return type.capitalized
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
