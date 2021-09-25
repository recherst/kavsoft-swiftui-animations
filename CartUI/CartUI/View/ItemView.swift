//
//  ItemView.swift
//  CartUI
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI

struct ItemView: View {
    @Binding var item: Item
    var body: some View {
        HStack(spacing: 15) {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(15)

            VStack(alignment: .leading, spacing: 10, content: {
                Text(item.name)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)

                Text(item.details)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)

                HStack(spacing: 15) {
                    Text("\(getPrice(value: item.price))")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)

                    Spacer(minLength: 0)

                    Button(action: {
                        if item.quantity > 1 {
                            item.quantity -= 1
                        }
                    }, label: {
                        Image(systemName: "minus")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.black)
                    })

                    Text("\(item.quantity)")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color.black.opacity(0.06))

                    Button(action: {
                        item.quantity += 1
                    }, label: {
                        Image(systemName: "plus")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.black)
                    })
                }
            })
        }
        .padding()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getPrice(value: Float) -> String {
    let format = NumberFormatter()
    format.numberStyle = .currency
    return format.string(from: NSNumber(value: value)) ?? ""
}
