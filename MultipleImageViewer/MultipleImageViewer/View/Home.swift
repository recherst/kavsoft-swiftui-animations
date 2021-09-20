//
//  Home.swift
//  MultipleImageViewer
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()

    // SwiftUI has bug in page tab bar
    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
        ScrollView {
            // Tweet view
            HStack(alignment: .top, spacing: 15, content: {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 10, content: {
                    // In SwiftUI we can concatenate two or more Text's
                    (
                        Text("Kavsoft  ")
                            .fontWeight(.bold)
                        +

                        Text("@_Kavsoft")
                            .foregroundColor(.gray)
                    )

                    Text("#ios #swiftui #kavsoft")
                        .foregroundColor(.blue)

                    Text("iJustine New Photos :))))")

                    // Our custom grid of items
                    // Since we have only two columns in a row and max is 4 grid boxes
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 10, content: {

                        ForEach(homeData.allImages.indices, id: \.self) { index in
                            GridImageView(index: index)
                        }
                    })
                    .padding(.top)
                })
            })
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .overlay(
            // Image view
            ZStack {
                if homeData.showImageViewer {
                    Color("bg")
                        .opacity(homeData.bgOpacity)
                        .ignoresSafeArea()

                    ImageView()
                }
            }
        )
        // Set environment object
        .environmentObject(homeData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
