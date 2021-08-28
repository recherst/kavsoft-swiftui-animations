//
//  TimeViewModel.swift
//  CustomTimerApp
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI


class TimerData: ObservableObject {
    @Published var time: Int = 0
    @Published var selectedTime: Int = 0

    // Animation properties
    @Published var buttonAnimation = false

    // TimerView Data
    @Published var timerViewOffset: CGFloat = UIScreen.main.bounds.height
    @Published var timerHeightChange: CGFloat = 0
}
