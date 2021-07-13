//
//  ListDelete.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
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

// onDelete, onMove, onInset

// These three functions only work on views that implement the DynamicViewContent
// protocol. Currently, the only view that conforms to the DynamicViewContent
// protocol is the ForEach view. So these functions are only available on a
// ForEach view, not a List view.

struct ListDelete_Previews: PreviewProvider {
    static var previews: some View {
        ListDelete()
    }
}
