//
//  AddPageView.swift
//  RealmDB
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

struct AddPageView: View {
    @EnvironmentObject var modelData: DBViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        // To get form like view
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    TextField("", text: $modelData.title)
                }

                Section(header: Text("Detail")) {
                    TextField("", text: $modelData.detail)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Add Data")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Text("Done")
                    })
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
            }
        }
    }
}

struct AddPageView_Previews: PreviewProvider {
    static var previews: some View {
        AddPageView()
    }
}
