//
//  HomeViewModel.swift
//  TaskApp
//
//  Created by recherst on 2021/9/30.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {

    @Published var content = ""
    @Published var date = Date()

    // For NewDate Sheet
    @Published var isNewData = false

    // Check and update date

    // Store update item
    @Published var updateItem: Task!

    let calender = Calendar.current
    func checkDate() -> String {
        if calender.isDateInToday(date) {
            return "Today"
        } else if calender.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            return "Other day"
        }
    }

    func updateDate(value: String) {
        if value == "Today" { date = Date() }
        else if value == "Tomorrow" {
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        } else {
            // Do something
        }
    }

    func writeData(context: NSManagedObjectContext) {

        // Update item
        if updateItem != nil {
            // Means update old data
            updateItem.date = date
            updateItem.content = content

            try! context.save()

            // Remove updateItem if successful
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            return
        }
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content

        // Save data
        do {
            try context.save()
            // Success means closing view
            isNewData.toggle()
            content = ""
            date = Date()
        } catch {
            print(error.localizedDescription)
        }
    }

    func EditItem(item: Task) {
        updateItem = item
        // Toggle the newDateView
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
    
}
