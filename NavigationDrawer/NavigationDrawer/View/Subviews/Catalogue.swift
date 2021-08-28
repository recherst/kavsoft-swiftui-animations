//
//  Catalogue.swift
//  NavigationDrawer
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI

struct Catalogue: View {
    @Environment(\.colorScheme) var scheme

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 15, content: {
                        Image("homepod")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                            .offset(x: -20, y: -10)

                        Text("Apple HomePod Mini")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)

                        Text("Great Music With Affordable Price!!")
                            .foregroundColor(.gray)

                    })
                    .padding(.bottom, 55)
                    .padding(.leading, 7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        Color.primary.opacity(0.06)
                            .cornerRadius(20)
                            .padding(.top, 70)
                    )
                    .offset(x: 70)
                    .overlay(
                        Button(action: {}, label: {
                            Image(systemName: "bag.fill")
                                .font(.title)
                                // For dark mode adoption
                                .foregroundColor(scheme == .dark ? .black : .white)
                                .padding(20)
                                .background(Color.primary)
                                .cornerRadius(15)
                        })
                        .offset(x: -30, y: 35)
                        , alignment: .bottomTrailing
                    )
                    .padding(.vertical, 35)

                    // Card view
                    CardView(image: "google", title: "Google Home")
                        .padding(.top, 25)

                    CardView(image: "alexa", title: "Alexa")
                }
            }
            .navigationTitle("Catalogue")
        }
    }
}

struct Catalogue_Previews: PreviewProvider {
    static var previews: some View {
        Catalogue()
    }
}

struct CardView: View {
    var image: String
    var title: String

    var body: some View {
        HStack(spacing: 15) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)

            VStack(alignment: .leading, spacing: 8, content: {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Great Music with Best Price")
                    .font(.caption)
                    .foregroundColor(.gray)
            })
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
