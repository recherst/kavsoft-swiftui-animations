//
//  Detail.swift
//  ECommerceAppUI
//
//  Created by recherst on 2021/9/13.
//

import SwiftUI

struct Detail: View {
    @Binding var selectedItem: Item
    @Binding var show: Bool

    var animation: Namespace.ID
    var body: some View {
        VStack {
            HStack(spacing: 25) {

                Button(action: {
                    // Close view
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                })
                Spacer()

                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(.black)
                })

                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bag")
                        .font(.title)
                        .foregroundColor(.black)
                })
            }
            .padding()

            VStack {
                Image(selectedItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                    .padding()

                Text(selectedItem.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)

                Text(selectedItem.subTitle)
                    .foregroundColor(.gray)
                    .padding(.top, 4)

                HStack {
                    Text(selectedItem.rating)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "suit.heart")
                            .font(.title2)
                            .foregroundColor(.black)
                    })
                    .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                }
                .padding()
            }
            .padding()
            .background(
                Color(selectedItem.image)
                    .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
            )
            .cornerRadius(15)
            .padding()

            Spacer()
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
