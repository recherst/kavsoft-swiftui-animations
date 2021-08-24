//
//  ContentView.swift
//  WalkthroughScreens
//
//  Created by recherst on 2021/8/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        if currentPage > totalPage {
            Home()
        } else {
            WalkthroughtScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
