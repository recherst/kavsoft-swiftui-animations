//
//  ListWithData.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
//

import SwiftUI

struct ListWithData: View {
    var stringArray = ["This is the simplest List", "Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Adam", "Rodrigo", "Notice the automatic wrapping when the content is larger"]
    var body: some View {
        List(stringArray, id: \.self) { string in
            Text(string)
        }
        // Apply this font style to all items in the list
        .font(.largeTitle)
    }
}

// What is that .id parameter?

// You use this parameter to tell the List how it can uniquely identify each row
// by which value. The List needs to know this so it can compare rows by this value
// to perform different operations like reordering and deleting rows for us.

// In this scenario, we are using "self" to say, "Just use the value of the string itself to uniquely identify each row."

struct ListWithData_Previews: PreviewProvider {
    static var previews: some View {
        ListWithData()
    }
}
