//
//  FormSectionheadersAndFooters.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct FormSectionheadersAndFooters: View {
    var body: some View {
        Form {
            Section(header: Text("Section header Text")) {
                Text("You can add any view in a section header")
                Text("Notice the default foreground color is gray")
            }
            Section(header: SectionTextAndImage(name: "People", image: "person.2.square.stack.fill")) {
                Text("Here is an example of a section header with image and text")
            }
            Section(header: Text(""), footer: Text("Total: $5,600.00").bold()) {
                Text("Here is an example of a section footer")
            }
        }
    }
}

struct SectionTextAndImage: View {
    var name: String
    var image: String

    var body: some View {
        HStack {
            Image(systemName: image)
                .padding(.trailing)
            Text(name)
        }
        .padding()
        .font(.title)
        .foregroundColor(Color.purple)
    }
}

struct FormSectionheadersAndFooters_Previews: PreviewProvider {
    static var previews: some View {
        FormSectionheadersAndFooters()
    }
}
