//
//  NavigationWithListNoNavBar.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/12.
//

import SwiftUI

struct NavigationWithListNoNavBar: View {
    @State var books = ["The Way of Kings", "Words of Radiance", "Oathbringer"]

    var body: some View {
        NavigationView {
            List {
                Section(
                    header: Text("Brandon Stanerson Books")
                        .font(.title)
                ) {
                    ForEach(books, id: \.self) { book in
                        /*
                        NavigationLink(
                            destination: BookDetail(bookItem: book),
                            label: {
                                Text(book)
                                    .font(Font.system(size: 24))
                                    .padding()
                            })
                        */
                        NavigationLink(
                            destination: BookDetailNoBack(bookItem: book),
                            label: {
                                Text(book)
                                    .font(Font.system(size: 24))
                                    .padding()
                            }
                        )
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            // Your back button text
            .navigationBarTitle("Book List")
            // Now this just looks like a regular list
            // view but has navigation on the rows.
            .navigationBarHidden(true)
        }
    }
}

struct BookDetail: View {
    var bookItem: String!

    var body: some View {
        VStack {
            Text("Book Details")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Theme3ForegroundColor"))
                .foregroundColor(Color("Theme3BackgroundColor"))
            Spacer()
            Text(bookItem)
                .font(.title)
            Spacer()
        }
        .navigationBarTitle(bookItem)
    }
}

struct NavigationWithListNoNavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationWithListNoNavBar()
    }
}
