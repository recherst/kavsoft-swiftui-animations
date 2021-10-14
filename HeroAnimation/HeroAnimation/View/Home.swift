//
//  Home.swift
//  HeroAnimation
//
//  Created by recherst on 2021/10/14.
//

import SwiftUI

struct Home: View {
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)

    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                HStack {
                    Text("Travel")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.black)

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "filemenu.and.selection")
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                    })
                }
                .padding([.horizontal, .top])

                LazyVGrid(columns: columns, spacing: 25, content: {
                    ForEach(data) { travel in
                        VStack(alignment: .leading, spacing: 10, content: {
                            Image(travel.image)
                                .resizable()
                                .frame(height: 180)
                                .cornerRadius(15)

                            Text(travel.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        })
                    }
                })
                .padding(.horizontal)
            })
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
