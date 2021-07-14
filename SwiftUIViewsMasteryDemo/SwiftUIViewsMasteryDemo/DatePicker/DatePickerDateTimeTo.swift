//
//  DatePickerDateTimeTo.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct DatePickerDateTimeTo: View {

    @State private var arrivalDate = Date()

    let mainColor = Color("LightPinkColor")

    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker")
                .font(.largeTitle)
            Text("To Date or Time")
                .foregroundColor(.gray)
            Text("You can set a maximum date or time that you cannot go past with the date picker")
                .frame(maxWidth: .infinity)
                .padding()
                .background(mainColor)

            Image("baby")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text("Date and Time of Birth")

            DatePicker(
                "",
                selection: $arrivalDate,
                in: ...Date(),
                displayedComponents: [.date, .hourAndMinute]
            )
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(mainColor, lineWidth: 2)
            )
            .padding(.horizontal)
            .labelsHidden()
        }
        .font(.title)
    }
}

struct DatePickerDateTimeTo_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerDateTimeTo()
    }
}
