//
//  Home.swift
//  MobileWalletCardAnimation
//
//  Created by recherst on 2021/8/7.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.title)
                            .foregroundColor(.primary)
                    })

                    Spacer(minLength: 0)

                    Button(action: {}, label: {
                        Image("pic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    })
                }

                // Card view
                ZStack {
                    // Since ZStack will overlay on one another so last card will be first
                    // To Avoid this were reversing the arary
                    ForEach(cards.indices.reversed(), id: \.self) { index in
                        CardView(card: cards[index])
                    }
                }
                // rotating all cards
                .rotationEffect(Angle(degrees: 90))
                // Since were rotating so height will be the width
                // -30 will be horizontal padding
                .frame(height: rect.width - 30)
                .padding(.top, 20)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.04).ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Extending view to get screen frame
extension View {

    var rect: CGRect {
        UIScreen.main.bounds
    }
}


// Card view
struct CardView: View {
    var card: Card

    var body: some View {
        Image(card.cardImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()

                    Text(card.cardNumber)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 25)

                    Spacer()

                    HStack {
                        VStack(alignment: .leading, spacing: 4, content: {
                            Text("CARD HOLDER")
                                .fontWeight(.semibold)

                            Text(card.cardHolder)
                                .font(.title2)
                                .fontWeight(.bold)

                        })

                        Spacer(minLength: 10)

                        VStack(alignment: .leading, spacing: 4, content: {
                            Text("VALID TILL")
                                .fontWeight(.semibold)

                            Text(card.cardValidity)
                                .fontWeight(.bold)

                        })
                    }
                    .foregroundColor(.white)
                }
                .padding()
            )
    }
}
