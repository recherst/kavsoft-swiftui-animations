//
//  CardView.swift
//  SwiftUIStackedCarouselSlider
//
//  Created by recherst on 2021/10/2.
//

import SwiftUI

struct CardView: View {
    var card: Book
    var body: some View {
        VStack {
            // You can display all details
            // I'm displaying only read button
            Spacer(minLength: 0)

            HStack {
                Button(action: {}) {
                    Text("Read Now")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color("purple"))
                        .clipShape(Capsule())
                }
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.bottom, 10)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
