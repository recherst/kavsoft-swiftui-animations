//
//  Persistence.swift
//  TaskApp
//
//  Created by recherst on 2021/9/30.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    // If you want preview, use this
    /*
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    */
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TaskApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "dev/null")
        }
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                print(error)
            }
        }
    }
}
