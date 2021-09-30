//
//  ContentView.swift
//  TaskApp
//
//  Created by recherst on 2021/9/30.
//

import SwiftUI

struct ContentView: View {

    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
