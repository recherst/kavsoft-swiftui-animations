//
//  Home.swift
//  VPNAppUI
//
//  Created by recherst on 2021/9/16.
//

import SwiftUI

struct Home: View {
    var gradient = [
        Color("gradient1"),
        Color("gradient2"),
        Color("gradient3"),
        Color("gradient4")
    ]
    var body: some View {
        VStack {
            VStack {
                Text("AESTHER")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()

                Spacer()

                Text("STATUS")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("DISCONNECTED")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 5)
            }
            .frame(height: UIScreen.main.bounds.height / 3.3)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: .init(colors: gradient),
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
