//
//  ContentView.swift
//  NavigationSearchBar
//
//  Created by recherst on 2021/9/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomNavigationView(view: Home())
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
