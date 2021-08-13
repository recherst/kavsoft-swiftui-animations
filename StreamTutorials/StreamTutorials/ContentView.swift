//
//  ContentView.swift
//  StreamTutorials
//
//  Created by recherst on 2021/8/14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var streamData = StreamViewModel()
    var body: some View {
        NavigationView {
            Login()
                .navigationTitle("Login")
        }
        .alert(isPresented: $streamData.error, content: {
            Alert(title: Text(streamData.errorMsg))
        })
        .overlay(
            ZStack {
                // Loading screen


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
