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
                        ItemView(item: $cartData.items[getIndex(item: item)])
                    }
                }
            })
        }
        .background(Color("gray").ignoresSafeArea())
    }

    func getIndex(item: Item) -> Int {
        cartData.items.firstIndex { item.id == $0.id } ?? 0
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
