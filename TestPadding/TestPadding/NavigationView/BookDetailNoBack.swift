//
//  BookDetailNoBack.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/12.
//

import SwiftUI

struct BookDetailNoBack: View {
    @Environment(\.presentationMode) var presentationMode

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
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Text("Go Back")
                }
            }
            Spacer()
        }
        .navigationBarTitle(bookItem)
        .navigationBarHidden(true)
    }
}

struct BookDetailNoBack_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailNoBack()
    }
}
