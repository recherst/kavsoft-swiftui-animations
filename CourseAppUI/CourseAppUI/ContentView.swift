//
//  ContentView.swift
//  CourseAppUI
//
//  Created by recherst on 2021/10/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CustomTabView()
                .navigationTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
