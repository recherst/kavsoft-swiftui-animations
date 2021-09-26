//
//  BagView.swift
//  ShopAppUI
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI

struct BagView: View {
    var bagData: BagModel
    var animation: Namespace.ID
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            ZStack {
                Color(bagData.image)
                    .cornerRadius(15)

                Image(bagData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 180)
                    .padding(20)
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            }

            Text(bagData.title)
                .fontWeight(.heavy)
                .foregroundColor(.gray)

            Text(bagData.price)
                .fontWeight(.heavy)
                .foregroundColor(.black)
        })
    }
}

struct BagView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
