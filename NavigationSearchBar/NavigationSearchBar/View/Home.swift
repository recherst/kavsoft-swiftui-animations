//
//  Home.swift
//  NavigationSearchBar
//
//  Created by recherst on 2021/9/11.
//

import SwiftUI

struct Home: View {
    // For search bar
    @Binding var filteredItems: [AppItem]
    var body: some View {
        // App list view
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 15) {
                // Apps List
                ForEach(filteredItems) { item in
                    // Card view
                    CardView(item: item)
                }
            }
            .padding()
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
