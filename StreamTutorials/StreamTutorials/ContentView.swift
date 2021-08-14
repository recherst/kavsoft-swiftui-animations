//
//  ContentView.swift
//  StreamTutorials
//
//  Created by recherst on 2021/8/14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var streamData = StreamViewModel()

    @AppStorage("log_Status") var logStatus = false

    var body: some View {
        NavigationView {
            if logStatus {
                Login()
                    .navigationTitle("Login")
            } else {
                ChannelView()
            }
        }
        .alert(isPresented: $streamData.error, content: {
            Alert(title: Text(streamData.errorMsg))
        })
        .overlay(
            ZStack {
                // New Channel View
                if streamData.createNewChannel {
                    CreateNewChannel()
                }
                // Loading screen
                if streamData.isLoading { LoadingScreen() }
            }
        )
        .environmentObject(streamData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
