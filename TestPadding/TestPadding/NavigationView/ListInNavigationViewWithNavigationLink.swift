//
//  ListInNavigationViewWithNavigationLink.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/12.
//

import SwiftUI

struct ListInNavigationViewWithNavigationLink: View {
    @State var data = ["Milk", "Bread", "Tomatoes", "Lettuce", "Onions", "Rice", "Limes", "Butter"]
    var body: some View {
        NavigationView {
            List(data, id: \.self) { datum in
                // Navigate to detail view
                NavigationLink(
                    destination: ShoppingDetail(shoppingItem: datum),
                    label: {
                        Text(datum)
                            .font(Font.system(size: 24))
                            .padding()
                    })
            }
            // some changes on iOS 14, [see here](https://stackoverflow.com/questions/56474019/how-to-change-liststyle-in-list)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Shopping")
            .navigationBarItems(
                trailing: Button("Add") {
                    data.append("New Shopping Item")
                }
            )
        }
    }
}

struct ShoppingDetail: View {
    var shoppingItem: String!

    var body: some View {
        VStack {
            Text("Shopping List Details")
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Theme3ForegroundColor"))
                .foregroundColor(Color("Theme3BackgroundColor"))
            Spacer()
            Text(shoppingItem)
                .font(.title)
            Spacer()
        }
        .navigationBarTitle(shoppingItem)
    }
}
struct ListInNavigationViewWithNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        ListInNavigationViewWithNavigationLink()
    }
}
