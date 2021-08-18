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

}
