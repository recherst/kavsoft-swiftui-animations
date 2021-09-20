//
//  Home.swift
//  MobileWalletCardAnimation
//
//  Created by recherst on 2021/8/7.
//

import SwiftUI

struct Home: View {
    // Animation properties
    @State var startAnimation = false
    @State var startCardRotation = false
    @State var selectedCard: Card = Card(cardHolder: "", cardNumber: "", cardValidity: "", cardImage: "")

    // Hero effect
    @State var cardAnimation = false
    @Namespace var animation

    // Color scheme
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 15) {
                    Button(action: {}, label: {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.title)
                            .foregroundColor(.primary)
                    })

                    Text("Welcome Back !!!")
                        .font(.title2)
                        .fontWeight(.bold)

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
                        // Displaying first three, other all will be hidden
                        // You can use ScrollView to explore all cards
                        // Scaling
                            .scaleEffect(selectedCard.id == cards[index].id ? 1 : index == 0 ? 1 : 0.9)
                        // Rotation
                        // Resetting rotation when clicked
                            .rotationEffect(Angle(degrees: startAnimation ? 0 : index == 1 ? -15 : (index == 2 ? 15 : 0)))
                        // On click
                            .onTapGesture {
                                animationView(card: cards[index])
                            }
                            .offset(y: startAnimation ? 0 : index == 1 ? 60 : (index == 2 ? -60 : 0))
                        // Since we applied rotation so we need change y in order to get x Axis
                        // Hero effect
                            .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
                            .rotationEffect(Angle(degrees: selectedCard.id == cards[index].id && startCardRotation ? -90 : 0))
                        // Moving the selected card to top
                            .zIndex(selectedCard.id == cards[index].id ? 1000 : 0)
                        // Hiding unselected cards
                            .opacity(cardAnimation ? selectedCard.id == cards[index].id ? 1 : 0 : 1)
                    }
                }
                // rotating all cards
                .rotationEffect(Angle(degrees: 90))
                // Since were rotating so height will be the width
                // -30 will be horizontal padding
                .frame(height: rect.width - 30)
                .scaleEffect(0.9)
                .padding(.top, 20)

                // Total amount spent
                VStack(alignment: .leading, spacing: 6, content: {
                    Text("Total Amount Spent")
                        .font(.callout)
                        .foregroundColor(.gray)
                    Text("$1,451.00")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.04).ignoresSafeArea())
        // Blur the whole view
        .blur(radius: cardAnimation ? 100 : 0)
        .overlay(
            ZStack(alignment: .topTrailing, content: {
                // Detail view
                if cardAnimation {
                    // Close button
                    Button(action: {
                        // Closing the view
                        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.5)) {
                            startCardRotation = false
                            selectedCard = Card(cardHolder: "", cardNumber: "", cardValidity: "", cardImage: "")
                            cardAnimation = false
                            startAnimation = false
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(colorScheme != .dark ? .white : .black)
                            .padding()
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                    .padding()

                    // Card View
                    CardView(card: selectedCard)
                        .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            })
        )
    }


    func animationView(card: Card) {
        // Settng current card
        selectedCard = card
        // Rotating card and blurring the whole view
        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5)) {
            // To avoid multiple clicks so we're avoiding using toggle()
            startAnimation = true
        }

        // After 0.2s rotating card
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.spring()) {
                startCardRotation = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.spring()) {
                cardAnimation = true
            }
        }
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
