//
//  JSONViewModel.swift
//  CompositionalLayout
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

class JSONViewModel: ObservableObject {
    @Published var cards: [Card] = []

    @Published var search = ""

    // Compositional layout array
    @Published var compositionalArray: [[Card]] = []

    init() {
        fetchJSON()
    }

    func fetchJSON() {
        let url = "https://picsum.photos/v2/list?page=2&limit=100"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let json = data else { return }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let cards = try? decoder.decode([Card].self, from: json) else { return }

            DispatchQueue.main.async {
                self.cards = cards
                self.setCompositionalLayout()
            }

        }
        .resume()
    }

    func setCompositionalLayout() {
        var currentArrayCards: [Card] = []
        cards.forEach { card in
            currentArrayCards.append(card)

            if currentArrayCards.count == 3 {
                // Append to main array
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }

            // If not 3 or even no of cards
            if currentArrayCards.count != 3 && card.id == cards.last!.id {
                // Append to main array
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
        }
    }
}
