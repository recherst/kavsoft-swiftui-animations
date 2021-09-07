//
//  DBViewModel.swift
//  RealmDB
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI
import RealmSwift

class DBViewModel: ObservableObject {
    @Published var title = ""
    @Published var detail = ""

    @Published var openNewPage = false

    @Published var cards: [Card] = []

    @Published var updateObject: Card?
    

    init() {
        fetchData()
    }

    // Feteched data
    func fetchData() {
        guard let dbRef = try? Realm() else { return }

        let results = dbRef.objects(Card.self)

        // Display results
        cards = results.compactMap { $0 }
    }

    // Add new data
    func addData(presentation: Binding<PresentationMode>) {
        let card = Card()
        card.title = title
        card.detail = detail

        // Get reference
        guard let dbRef = try? Realm() else { return }
        // Write data
        try? dbRef.write({
            // Check and write
            guard let avaliableObject = updateObject else {
                dbRef.add(card)
                return
            }

            avaliableObject.title = title
            avaliableObject.detail = detail
        })
        // Update UI
        fetchData()
        // Close view
        presentation.wrappedValue.dismiss()
    }

    // Delete data
    func deleteData(object: Card) {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write({
            dbRef.delete(object)

            fetchData()
        })
    }

    // Set and Clear data
    func setupInitialData() {
        guard let updateData = updateObject else { return }

        // Check if it's update object and assign values
        title = updateData.title
        detail = updateData.detail

    }

    func deInitData() {
        title = ""
        detail = ""
    }
}
