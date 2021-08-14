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

    // Channel Data
    @Published var channels: [ChatChannelController.ObservableObject]!

    // Create New Channel
    @Published var createNewChannel = false
    @Published var channelName = ""

    func logInUser() {
        // Logging in user
        withAnimation {
            isLoading = true
        }

        let config = ChatClientConfig(apiKey: APIKey(APIKEY))
        ChatClient.shared = ChatClient(config: config, tokenProvider: .guest(userId: userName))
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

    // Fetching All Channels
    func fetchAllChannels() {
        if channels == nil {
            // Filter
            let filter = Filter<ChannelListFilterScope>.equal("type", to: "messaging")
            let request = ChatClient.shared.channelListController(query: _ChannelListQuery<NoExtraData>(filter: filter))
            request.synchronize { err in
                if let error = err {
                    self.errorMsg = error.localizedDescription
                    self.error.toggle()
                    return
                }
                // Else successful
                self.channels = request.channels.compactMap({ channel in
                    return ChatClient.shared.channelController(for: channel.cid).observableObject
                })
            }
        }
    }

    // Create new channel
    func createChannel() {
        withAnimation { self.isLoading = true }
        let normalizeChannelName = channelName.replacingOccurrences(of: " ", with: "-")
        let newChannel = ChannelId(type: .messaging, id: normalizeChannelName)

        // You can give image url to channel
        // same you can also give image urlto user
        let request = try! ChatClient.shared
            .channelController(
                createChannelWithId: newChannel,
                name: channelName,
                imageURL: nil,
                extraData: .defaultValue
            )

        request.synchronize { err in
            withAnimation { self.isLoading = false }

            if let error = err {
                self.errorMsg = error.localizedDescription
                self.error.toggle()
                return
            }

            // Success, closing Loading and new channel view
            self.channelName = ""
            withAnimation { self.createNewChannel = false }
        }
    }
}
