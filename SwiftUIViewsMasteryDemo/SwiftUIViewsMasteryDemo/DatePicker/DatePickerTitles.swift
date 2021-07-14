//
//  DatePickerTitles.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct DatePickerTitles: View {

    @State private var nextFullMoonDate = Date()

    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker")
                .font(.largeTitle)
            Text("Titles")
                .foregroundColor(.gray)
                .font(.title)
            Text("You can privide an optional title for pickers.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .font(.title)

            // The first parameter is a label or title for the picker
            DatePicker("Date of next full moon", selection: $nextFullMoonDate, displayedComponents: .date)
                .padding(.horizontal)

            Text("This doesn't really look good. So you might want to add your own title.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .font(.title)
        }
    }
}

struct DatePickerTitles_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerTitles()
    }
}
