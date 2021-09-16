//
//  Home.swift
//  VPNAppUI
//
//  Created by recherst on 2021/9/16.
//

import SwiftUI

struct Home: View {
    var gradient1 = [
        Color("gradient2"),
        Color("gradient3"),
        Color("gradient4")
    ]

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
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                Text("DISCONNECTED")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top, 5)
            }
            .frame(height: UIScreen.main.bounds.height / 3.3)
            // Button
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                LinearGradient(
                    gradient: .init(colors: gradient1),
                    startPoint: .top,
                    endPoint: .bottom
                )
                Button(action: {}, label: {
                    VStack(spacing: 15) {
                        Image(systemName: "power")
                            .font(.system(size: 70))
                            .foregroundColor(Color("power"))

                        Text("START")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(50)
                    .background(
                        LinearGradient(
                            gradient: .init(colors: [Color("pgradient1"), Color("pgradient2")]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .clipShape(Circle())
                    .padding(15)
                    .background(Color("power1").opacity(0.7))
                    .clipShape(Circle())
                    .padding(15)
                    .background(Color("gradient2").opacity(0.7))
                    .clipShape(Circle())
                })
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            ZStack {
                LinearGradient(
                    gradient: .init(colors: gradient),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                Color.black.opacity(0.1)
                    .ignoresSafeArea(.all, edges: .top)
            }
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
