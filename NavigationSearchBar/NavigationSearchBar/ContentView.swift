//
//  ContentView.swift
//  NavigationSearchBar
//
//  Created by recherst on 2021/9/11.
//

import SwiftUI

struct ContentView: View {
    @State var filteredItems = apps

    var body: some View {
        CustomNavigationView(view: AnyView(Home(filteredItems: $filteredItems)), placeHolder: "Apps, Games", largeTitle: true, title: "Kavsoft", onSearch: { text in
            // Filterting data
            if text != "" {
                filteredItems = apps.filter { $0.name.lowercased().contains(text.lowercased()) }
            } else {
                filteredItems = apps
            }
        }, onCancel: {
            filteredItems = apps
        })
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
