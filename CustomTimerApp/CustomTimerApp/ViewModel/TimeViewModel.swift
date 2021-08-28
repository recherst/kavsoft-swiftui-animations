//
//  TimeViewModel.swift
//  CustomTimerApp
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI
import UserNotifications


class TimerData: NSObject, UNUserNotificationCenterDelegate, ObservableObject {
    @Published var time: Int = 0
    @Published var selectedTime: Int = 0

    // Animation properties
    @Published var buttonAnimation = false

    // TimerView Data
    @Published var timerViewOffset: CGFloat = UIScreen.main.bounds.height
    @Published var timerHeightChange: CGFloat = 0

    // Get time when it leaves the app
    @Published var leftTime: Date = Date()

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

        // Tell what to do when receives in foreground
        completionHandler([.banner, .sound])
    }

    // On tap
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {

        // When taped, reset view
        resetView()
        completionHandler()
    }

    func resetView() {
        withAnimation(.default) {
            time = 0
            selectedTime = 0
            timerHeightChange = 0
            timerViewOffset = UIScreen.main.bounds.height
            buttonAnimation = false
        }
    }

}
