//
//  ListStackView.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
//

import SwiftUI

// Using a List view is the most efficient way of displaying vertivally
// scrolling data. You can display data in a ScrollView, as you will see
// later on, but it will not be as efficient in terms of memory or performance
// as the List view.

struct ListStackView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("List")
                .font(.largeTitle)
            Text("Static Data")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can show static views or data within the list view. It does not have to be bound with data. It gives you a scrollable view.")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding()
                .background(Color.orange)
                .layoutPriority(1)
                .foregroundColor(.black)

            List {
                Text("Line One")
                Text("Line Two")
                Text("Line Three")
                Image("profile")
                Button("Click Here", action: {})
                    .foregroundColor(.green)
                HStack {
                    Spacer()
                    Text("Centerd Text")
                    Spacer()
                }
                .padding()
            }
            .font(.title)
        }
    }
}

struct ListStackView_Previews: PreviewProvider {
    static var previews: some View {
        ListStackView()
    }
}
