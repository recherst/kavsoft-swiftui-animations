//
//  StreamTutorialsApp.swift
//  StreamTutorials
//
//  Created by recherst on 2021/8/14.
//

import SwiftUI
import StreamChat

@main
struct StreamTutorialsApp: App {
    // Call Delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate 
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    // Different way of initializing the stream
    @AppStorage("userName") var storedUser = ""
    @AppStorage("log_Status") var logStatus = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let config = ChatClientConfig(apiKey: APIKey(APIKEY))
        // If user already logged in
        if logStatus {
            ChatClient.shared = ChatClient(config: config, tokenProvider: .development(userId: storedUser))
        } else {
            ChatClient.shared = ChatClient(config: config, tokenProvider: .anonymous)
        }
        return true
    }
}

// Stream API
extension ChatClient {
    static var shared: ChatClient!
}
