//
//  DateViewModel.swift
//  CustomTimePicker
//
//  Created by recherst on 2021/8/18.
//

import SwiftUI

class DateViewModel: ObservableObject {

    @Published var selectedDate = Date()

    @Published var showPicker = false

    @Published var hour: Int = 12
    @Published var minites: Int = 0

    // Switching betwwen hours and minites
    @Published var changeToMin = false
    // AM or PM
    @Published var symbol = "AM"

    // Angle
    @Published var angle: Double = 0

    func generateTime() {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"

        let correctHourValue = symbol == "AM" ? hour : hour + 12

        let date = format.date(from: "\(correctHourValue):\(minites)")
        self.selectedDate = date!

        withAnimation {
            showPicker.toggle()
            changeToMin = false
        }
    }

    func setTime() {
        let calender = Calendar.current
        // 24 Hrs
        hour = calender.component(.hour, from: selectedDate)
        symbol = hour <= 12 ? "AM" : "PM"
        hour = hour == 0 ? 12 : hour
        hour = hour <= 12 ? hour : hour - 12

        minites = calender.component(.minute, from: selectedDate)

        angle = Double(hour * 30)
    }

}
