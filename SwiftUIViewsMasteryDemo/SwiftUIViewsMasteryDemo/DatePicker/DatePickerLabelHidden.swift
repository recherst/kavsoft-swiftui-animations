//
//  DatePickerLabelHidden.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct DatePickerLabelHidden: View {

    @State private var nextFullMoonDate = Date()

    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker")
                .font(.largeTitle)
            Text("Labels Hidden")
                .foregroundColor(.gray)

            Text("You use the .labelHidden modifier to let SwiftUI know not to render or reserve space for the label (title).")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)

            VStack(spacing: 0) {
                Text("Date of next full moon")
                DatePicker("Select date for next full moon", selection: $nextFullMoonDate, displayedComponents: .date)
                    .labelsHidden() // Hide the label/title
                // You will see later how labelsHidden can apply to many views
                // with labels, not just the DatePicker.
            }
        }
        .font(.title)
    }
}

// Note: Even though the label/title is not shown, I would still recommend
// having one because it will still be used for accessiblity purposes.

struct DatePickerLabelHidden_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerLabelHidden()
    }
}
