//
//  ContentView.swift
//  SpotifyUI
//
//  Created by recherst on 2021/8/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
        // always dark mode
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
