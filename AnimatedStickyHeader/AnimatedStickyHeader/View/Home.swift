//
//  Home.swift
//  AnimatedStickyHeader
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            // Since we're pinning header view
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                // Cards
                Section(header: Text("Title")) {
                    ForEach(foods) { food in
                        CardView(food: food)
                    }
                }
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
