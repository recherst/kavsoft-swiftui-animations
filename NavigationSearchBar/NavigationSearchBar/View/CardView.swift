//
//  CardView.swift
//  NavigationSearchBar
//
//  Created by recherst on 2021/9/11.
//

import SwiftUI

struct CardView: View {
    var item: AppItem
    @State var show = false
    var body: some View {
        HStack(spacing: 15) {
            Image(item.name)
                .resizable()
                .frame(width: 65, height: 65)

            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text(item.name)
                            .font(.title2)

                        Text(item.source)
                            .font(.caption)
                            .foregroundColor(.gray)
                    })

                    Spacer(minLength: 10)

                    VStack {
                        Button(action: {
                            show.toggle()
                        }, label: {
                            Text(show ? "Open" : "Get")
                                .fontWeight(.heavy)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .background(Color.primary.opacity(0.1))
                                .clipShape(Capsule())

                        })

                        Text("In App Purchase")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }

                Divider()
            }
        }
        .padding(.horizontal)
    }
}

