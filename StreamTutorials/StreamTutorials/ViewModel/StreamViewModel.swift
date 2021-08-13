//
//  StreamViewModel.swift
//  StreamTutorials
//
//  Created by recherst on 2021/8/14.
//

import SwiftUI
import StreamChat

class StreamViewModel: ObservableObject {

    @Published var userName = ""

    @AppStorage("userName") var storedUser = ""
    @AppStorage("log_Status") var logStatus = false

    // Alert
    @Published var error = false
    @Published var errorMsg = ""

    @Published var isLoading = false

    func logInUser() {
        // Logging in user
        withAnimation {
            isLoading = true
        }

        let config = ChatClientConfig(apiKeyString: APIKey)
        ChatClient.shared = ChatClient(config: config, tokenProvider: .development(userId: userName))
        ChatClient.shared.currentUserController().reloadUserIfNeeded { err in

            withAnimation { self.isLoading = false }

            if let error = err {
                self.errorMsg = error.localizedDescription
                self.error.toggle()
                return
            }

            // Else successfully
            // Store user name
            self.storedUser = self.userName
            self.logStatus = true
        }
    }
    
}
