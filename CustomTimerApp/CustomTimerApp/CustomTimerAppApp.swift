//
//  CustomTimerAppApp.swift
//  CustomTimerApp
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI

@main
struct CustomTimerAppApp: App {
    @StateObject var data = TimerData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
    }
}
