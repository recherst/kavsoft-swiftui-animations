//
//  CardView.swift
//  ECommerceAppUI
//
//  Created by recherst on 2021/9/13.
//

import SwiftUI

struct CardView: View {
    var item: Item
    var animation: Namespace.ID
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 0)

                Text(item.price)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)



            }

            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 30)
                .padding(.bottom)
                .padding(.horizontal, 10)

            Text(item.title)
                .fontWeight(.bold)
                .foregroundColor(.black)

            Text(item.subTitle)
                .font(.caption)
                .foregroundColor(.gray)

            HStack {
                Button(action: {}, label: {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.black)
                })

                Spacer(minLength: 0)

                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
            }
            .padding()
        }
        .background(Color(item.image))
        .cornerRadius(15)
    }
}

