//
//  Home.swift
//  StackingElements
//
//  Created by recherst on 2021/10/8.
//

import SwiftUI

struct Home: View {
    @State var designTools = [
        Tools(id: 0, image: "sketch", name: "Sketch", offset: 0, place: 1),
        Tools(id: 1, image: "figma", name: "Figma", offset: 0, place: 2),
        Tools(id: 2, image: "xd", name: "XD", offset: 0, place: 3),
        Tools(id: 3, image: "ilustrator", name: "Ilustrator", offset: 0, place: 4),
        Tools(id: 4, image: "ps", name: "Photoshop", offset: 0, place: 5),
        Tools(id: 5, image: "invision", name: "Invision", offset: 0, place: 6),
        Tools(id: 6, image: "affinity", name: "Affinity Photos", offset: 0, place: 7)
    ]
    // To track which card is swiped
    @State var swiped = 0
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Products")
                        .font(.system(size: 45))
                        .foregroundColor(.white)

                    HStack(spacing: 15) {
                        Text("Design tools")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white.opacity(0.7))

                        Button(action: {}, label: {
                            Image(systemName: "chevron.down")
                                .font(.system(size: 30))
                                .foregroundColor(Color("orange"))
                        })
                    }
                })

                Spacer(minLength: 0)
            }
            .padding()

            // Stacked Elements
            GeometryReader { reader in
                ZStack {
                    // ZStack will overlay on one another so revesing
                    ForEach(designTools.reversed()) { tool in
                        VStack {
                            Spacer(minLength: 0)

                            VStack {
                                Image(tool.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top)
                                    .padding(.horizontal, 25)

                                HStack {
                                    VStack(alignment: .leading, spacing: 12, content: {
                                        Text(tool.name)
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)

                                        Text("Design tool")
                                            .font(.system(size: 20))
                                            .foregroundColor(.black)

                                        Button(action: {}, label: {
                                            Text("Know More >")
                                                .font(.system(size: 20))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("orange"))
                                        })
                                        .padding(.top)
                                    })

                                    Spacer(minLength: 0)
                                }
                                .padding(.horizontal, 30)
                                .padding(.bottom, 15)
                                .padding(.top, 25)
                            }
                            .frame(height: reader.frame(in: .global).height - 120)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding(.horizontal, 30 - (CGFloat(tool.id) * 20))
                            .offset(y:tool.id <= 2 ? CGFloat(tool.id) * 25 : 50)

                            Spacer(minLength: 0)
                        }
                        .contentShape(Rectangle())
                    }
                }
            }
        }
        .background(
            LinearGradient(gradient: .init(colors: [Color("top"), Color("center"), Color("bottom")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
