//
//  PopularItemRowView.swift
//  FoodAppUI
//
//  Created by recherst on 2021/8/9.
//

import SwiftUI

struct PopularItemRowView: View {
    var item: Popular
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "flame")
                .font(.footnote)
                .foregroundColor(.red)
                .padding(8)
                .background(Color.orange.opacity(0.1))
                .clipShape(Circle())
                // Set it to right
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(-10)

            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: rect.width / 3, height: rect.width / 3)
                .padding(.top, 6)

            Text(item.title)
                .fontWeight(.bold)

            Text(item.description)
                .font(.footnote)
                .foregroundColor(.gray)
            (
                Text("$")
                    .font(.footnote)
                    .foregroundColor(Color("pink"))
                +
                    Text(item.price)
                    .font(.title2)
                    .foregroundColor(.black)
            )
            .fontWeight(.bold)
            .padding(.top, 8)
        }
        .padding(.horizontal, 30)
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(25)
        // Shadows
        .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
    }
}

struct PopularItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
