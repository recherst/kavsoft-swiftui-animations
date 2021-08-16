//
//  Home.swift
//  CustomScrollView
//
//  Created by recherst on 2021/8/16.
//

import SwiftUI

struct Home: View {
    @State var searchQuery = ""
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "star")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                }
                .padding()

                HStack {
                    (
                        Text("My ")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        Text("friends")
                            .foregroundColor(.gray)
                    )
                    .font(.largeTitle)

                    Spacer()
                }
                .padding()

                // Search bar
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.gray)

                    TextField("Seach", text: $searchQuery)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.05))
                .cornerRadius(8)
                .padding()

                // Divider line
                HStack {
                    Text("RECENTS")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)

                    Rectangle()
                        .fill(Color.gray.opacity(0.6))
                        .frame(height: 0.5)
                }
                .padding()
            }

            ScrollView(showsIndicators: false, content: {
                VStack(spacing: 15) {
                    ForEach(friends) { friend in
                        
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
