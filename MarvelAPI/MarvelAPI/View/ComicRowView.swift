//
//  ComicRowView.swift
//  MarvelAPI
//
//  Created by recherst on 2021/8/18.
//

import SwiftUI
import SDWebImageSwiftUI


struct ComicRowView: View {
    var comic: Comic

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            WebImage(url: extractImage(data: comic.thumbnail))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8, content: {
                Text(comic.title)
                    .font(.title3)
                    .fontWeight(.bold)

                if let description = comic.description {
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                }

                // Links
                HStack(spacing: 10) {
                    ForEach(comic.urls, id: \.self) { url in
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

struct ComicRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
