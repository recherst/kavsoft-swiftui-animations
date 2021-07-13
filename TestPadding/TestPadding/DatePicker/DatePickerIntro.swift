//
//  DatePickerIntro.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

// In order to get or set a value for the DatePicker, you need to bind it to a
// variable. This variable is then passed into the DatePicker's initializer.
// Then, all you need to do is change the value of the bound variable to set
// the date or time you want to show in the DatePicker. Or read the bound variable's
// value to see which date or time is currently selected.

// This is a pull-in view.
struct DatePickerIntro: View {
    // the date picker will use this variable to get and set its value
    @State private var nextFullMoonDate = Date()

    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)

            Text("Bind a date variable to get and set the date in the date picker")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)

            HStack {
                Spacer()
                Image(systemName: "moon.circle")
                Spacer()
                Circle()
                    .frame(width: 60, height: 60)
                Spacer()
                Image(systemName: "moon.circle.fill")
                Spacer()
            }
            .foregroundColor(Color.yellow)

            DatePicker("", selection: $nextFullMoonDate, displayedComponents: .date)

            Text("Notice the indent of the picker.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
        }
        .font(.title)
    }
}

struct DatePickerIntro_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerIntro()
    }
}
