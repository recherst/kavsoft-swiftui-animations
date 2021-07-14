//
//  GroupedListStyle.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
//

import SwiftUI

struct GroupedListStyle: View {
    var data = ["Custom Rows!", "Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Adam", "Rodrigo"]
    var body: some View {
        List(data, id: \.self) { datum in
            CustomRow(content: datum)
        }
    }
}

struct CustomRow: View {
    var content: String

    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
            Text(content)
            Spacer()
        }
        .foregroundColor(content == "Custom Rows!" ? Color.green : Color.primary)
        .font(.title)
        .padding([.top, .bottom])
    }
}

struct GroupedListStyle_Previews: PreviewProvider {
    static var previews: some View {
        GroupedListStyle()
    }
}
