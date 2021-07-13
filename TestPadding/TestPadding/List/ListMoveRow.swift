//
//  ListMoveRow.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
//

import SwiftUI

struct ListMoveRow: View {
    @State var data = ["Hit the Edit button to reorder", "Practice Coding", "Grocery shopping", "Get tickets", "Clean house", "Do laundry", "Cook dinner", "Paint room"]
    var body: some View {
        NavigationView {
            List {
                ForEach(data, id: \.self) { datum in
                    Text(datum)
                        .font(Font.system(size: 24))
                        .padding()
                }
                .onMove(perform: moveRow(from:to:))
            }
        }
    }

    func moveRow(from indexes: IndexSet, to destination: Int) {
        if let first = indexes.first {
            data.insert(data.remove(at: first), at: destination)
        }
    }
}

// What is EditButton()?

// This is a built-in function that returns a view (Button) that will
// automatically toggle edit mode on the List.
// Its text says "Edit" and then when tapped you will see the move handles
// appear on the rows and the button text says "Done".

struct ListMoveRow_Previews: PreviewProvider {
    static var previews: some View {
        ListMoveRow()
            .preferredColorScheme(.dark)
    }
}
