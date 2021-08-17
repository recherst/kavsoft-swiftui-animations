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

            VStack(alignment: .leading, spacing: 8, content: {
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.bold)

                Text(character.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
            })

            Spacer(minLength: 0)
        }
    }

    func extractImage(data: [String: String]) -> URL {
        // Combine both and form image
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")!
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
