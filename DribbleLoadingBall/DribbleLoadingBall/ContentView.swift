//
//  ContentView.swift
//  DribbleLoadingBall
//
//  Created by recherst on 2021/8/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Dribble Ball Animation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
