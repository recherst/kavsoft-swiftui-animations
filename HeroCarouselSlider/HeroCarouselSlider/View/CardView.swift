//
//  CardView.swift
//  HeroCarouselSlider
//
//  Created by recherst on 2021/9/8.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var model: CarouselViewModel
    var card: Card
    var body: some View {
        VStack {
            Text("Monday 28 December")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)

            HStack {
                Text(card.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 250, alignment: .leading)
                    .padding()

                Spacer(minLength: 0)
            }

            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(card.cardColor)
        .cornerRadius(25)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
