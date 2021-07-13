//
//  FormListRowBackground.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct FormListRowBackground: View {
    var body: some View {
        Form {
            Section(header: Text("Form").font(.largeTitle)) {
                Text("List Row background")
                    .foregroundColor(.gray)
                Text("Forms and Lists allow you to set a background view with a function called\"listRowBackground(view:)\".")
                    .fixedSize(horizontal: false, vertical: true)
                    // Using fixedSize is another way to get text not to truncate.
                    // See chapter on "Layout Modifiers" in full book.

                Text("You can call this modifier function on just one row, like this.")
                    .listRowBackground(Color.purple)
                    .foregroundColor(.white)
            }

            Section(
                header: Text("Whole Section")
                            .font(.title)
                            .foregroundColor(.gray)
            ) {
                Text("Or you can set a view or color for a whole section.")

                Image(systemName: "smiley.fill")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.largeTitle)

                Text("Note, even though the color is set on the Section, the color of the section header is not affected.")
                    .fixedSize(horizontal: false, vertical: true)
            }
            .foregroundColor(.white)
            .listRowBackground(Color.purple)
        }
        .font(.title)
    }
}

struct FormListRowBackground_Previews: PreviewProvider {
    static var previews: some View {
        FormListRowBackground()
    }
}
