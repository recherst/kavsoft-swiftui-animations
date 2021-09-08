//
//  Home.swift
//  ComposingComplexUI
//
//  Created by recherst on 2021/9/8.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {

            HStack {

                Button(action: {}, label: {
                    Image(systemName: "circle.grid.cross")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white.opacity(0.5), lineWidth: 0.5)
                        )
                })

                Spacer()

                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "crown.fill")
                            .foregroundColor(.yellow)

                        Text("Go Premium")
                            .fontWeight(.heavy)
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.black.opacity(0.2))
                    .clipShape(Capsule())
                })
            }
            .padding()

            Spacer()
        }
        .background(
            LinearGradient(
                gradient: .init(colors: [Color("bg11"), Color("bg12")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
