//
//  ContentView.swift
//  AudioVisualizer
//
//  Created by recherst on 2021/9/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("")
                .navigationBarHidden(true)
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
