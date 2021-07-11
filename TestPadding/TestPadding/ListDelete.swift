//
//  ListDelete.swift
//  TestPadding
//
//  Created by 刘勇刚 on 2021/7/11.
//

import SwiftUI

struct ListDelete: View {
    @State var data = ["Swipe to Delete", "Practice Coding", "Grocery shooping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    var body: some View {
        List {
            Section(header: Text("To Do").padding()) {
                ForEach(data, id: \.self) { datum in
                    Text(datum)
                        .font(Font.system(size: 24))
                        .padding()
                }
                // Enables swipe to delete
                .onDelete(perform: delete(at:))
            }
        }
    }

    func delete(at indexes: IndexSet) {
        if let first = indexes.first {
            data.remove(at: first)
        }
    }
}

struct ListDelete_Previews: PreviewProvider {
    static var previews: some View {
        ListDelete()
    }
}
