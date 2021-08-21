//
//  Home.swift
//  ShoeAnimationChallenge
//
//  Created by recherst on 2021/8/21.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        ZStack(alignment: .bottom) {
            // Home view
            VStack(spacing: 15) {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "rectangle.3.offgrid.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                    })
                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "bag.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple)
                            .clipShape(Circle())
                    })
                }
                .overlay(
                    Text("Nike")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                )
                .padding()

                ScrollView {
                    // Shoe cards
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Air Max Exosense 'Atomic Powder'")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)

                        Text("Nike")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                        Image("shoe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 30)

                        Text("Price")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        Text("$270.00")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("orange"))
                    })
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                    .background(Color.black.opacity(0.06))
                    .cornerRadius(20)
                    .overlay(
                        Capsule()
                            .fill(Color.purple)
                            .frame(width: 4, height: 45)
                            .padding(.top, 25)

                        , alignment: .topLeading
                    )
                    .padding()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            homeData.showCart.toggle()
                        }
                    }
                }
            }
            // Blur when cart is opened
            .blur(radius: homeData.showCart ? 50 : 0)

            AddToCart()
                .environmentObject(homeData)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.04).ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Add to cart view
struct AddToCart: View {
    @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image("shoe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                VStack(alignment: .trailing, spacing: 10) {
                    Text("Air Max Exosense 'Atomic Powder'")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.trailing)

                    Text("$270.00")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
            .padding()

            Divider()

            Text("SELECT SIZE")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, 10)

            // Sizes
            let colums = Array(repeating: GridItem(.flexible(), spacing: 12), count: 4)

            LazyVGrid(columns: colums, alignment: .leading, spacing: 15, content: {
                ForEach(sizes, id: \.self) { size in
                    Button(action: {
                        withAnimation {
                            homeData.selectedSize = size
                        }
                    }, label: {
                        Text(size)
                            .fontWeight(.semibold)
                            .foregroundColor(homeData.selectedSize == size ? .white : .black)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(homeData.selectedSize == size ? Color("orange") : Color.black.opacity(0.06))
                            .cornerRadius(15)
                    })
                }
            })

            // Add to cart button
            Button(action: {}, label: {
                Text("Add to cart")
                    .fontWeight(.bold)
                    .foregroundColor(homeData.selectedSize == "" ? .black : .white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(homeData.selectedSize == "" ? Color.black.opacity(0.06) : Color("orange"))
                    .cornerRadius(18)
            })
            // disable button when no size selected
            .disabled(homeData.selectedSize == "")
            .padding(.top)
        }
        .padding()
        .background(Color.white)
    }
}

let sizes = ["EU 40", "EU41", "EU42", "EU43", "EU44"]

// Extending view to get screen size
extension View {
    var rect: CGRect {
        UIScreen.main.bounds
    }
}
