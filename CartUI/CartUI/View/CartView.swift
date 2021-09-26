//
//  CartView.swift
//  CartUI
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI

struct CartView: View {
    @StateObject var cartData = CartViewModel()
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.black)
                })

                Text("My cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)

                Spacer()
            }
            .padding()

            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack(spacing: 0) {
                    ForEach(cartData.items) { item in
                        ItemView(item: $cartData.items[getIndex(item: item)], items: $cartData.items)
                    }
                }
            })

            // Bottom view
            VStack {
                HStack {
                    Text("Total")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)

                    Spacer()
                    // Calculate total price
                    Text(calculateTotalPrice())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .padding([.top, .horizontal])

                Button(action: {}, label: {
                    Text("Check out")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(
                            LinearGradient(gradient: .init(colors: [Color("lightblue"), Color("blue")]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
                })
            }
            .background(Color.white)
        }
        .background(Color("gray").ignoresSafeArea())
    }

    func getIndex(item: Item) -> Int {
        cartData.items.firstIndex { item.id == $0.id } ?? 0
    }

    func calculateTotalPrice() -> String {
        var price: Float = 0
        cartData.items.forEach { item in
            price += Float(item.quantity) * item.price
        }

        return getPrice(value: price)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
