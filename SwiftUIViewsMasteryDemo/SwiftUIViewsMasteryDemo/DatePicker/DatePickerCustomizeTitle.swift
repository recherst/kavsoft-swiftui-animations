//
//  DatePickerCustomizeTitle.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct DatePickerCustomizeTitle: View {

    @State private var nextFullMoonDate = Date()

    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker")
                .font(.largeTitle)
            Text("Your Own Title")
                .foregroundColor(.gray)
            Text("Even when you add your own title, you still have the problem with the date picker indenting.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)

            VStack(spacing: 0) {
                Text("Date of next full moon")
                    .font(.title)
                DatePicker("", selection: $nextFullMoonDate, displayedComponents: .date)
            }

            Text("How can you prevent the indenting?")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
        }
        .font(.title)
    }
}

struct DatePickerCustomizeTitle_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerCustomizeTitle()
    }
}
