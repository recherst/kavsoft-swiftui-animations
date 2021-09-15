//
//  ContentView.swift
//  SaladAppUI
//
//  Created by recherst on 2021/9/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
