//
//  DatePcikerFormsAndLists.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct DatePcikerFormsAndLists: View {

    @State private var dateInForm = Date()

    var body: some View {
        Form {
            Section(
                header: Text("DatePicker")
                            .font(.largeTitle)
                            .padding()
            ) {
                Text("Used In Forms")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()

                Text("The date picker looks different when used in a form. The first parameter called 'title' is used when in forms and lists.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .listRowBackground(Color.yellow)
                    .font(.title)

                DatePicker(
                    "DatePicker Collapsed (Default)",
                    selection: $dateInForm,
                    displayedComponents: .date
                )

                DatePicker(
                    "DatePicker Expanded (Selected)",
                    selection: $dateInForm,
                    displayedComponents: .date
                )
            }
        }
    }
}

// Labels work great when the date picker is used within a form.

struct DatePcikerFormsAndLists_Previews: PreviewProvider {
    static var previews: some View {
        DatePcikerFormsAndLists()
    }
}
