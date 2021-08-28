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
    // Use scene phase for scene data
    @Environment(\.scenePhase) var scene
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
        .onChange(of: scene) { newScene in
            if newScene == .background {
                // Store time
                data.leftTime = Date()
            }

            if newScene == .active && data.time != 0 {
                // When it enter again check the difference
                let diff = Date().timeIntervalSince(data.leftTime)

                let currentTime = data.selectedTime - Int(diff)
                if currentTime > 0 {
                    withAnimation(.default) {
                        data.selectedTime = currentTime
                    }
                } else {
                    // Reset view
                    data.resetView()
                }
            }
        }
    }
}
