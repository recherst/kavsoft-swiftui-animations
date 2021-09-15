//
//  Home.swift
//  SaladAppUI
//
//  Created by recherst on 2021/9/15.
//

import SwiftUI

struct Home: View {
    var animation: Namespace.ID
    var white = Color.white.opacity(0.85)

    fileprivate func Header(title: String) -> HStack<TupleView<(Text, Spacer)>> {
        return
            // Since both are same so we're going to make it as resuable
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(white)

                Spacer()
            }
    }

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "rectangle.grid.2x2")
                            .font(.title2)
                            .foregroundColor(white)
                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(white)
                    })
                }

                Text("Salads")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding([.horizontal, .bottom])
            .padding(.top, 10)

            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    Header(title: "Special Offers")
                    .padding()

                    HStack {
                        VStack(alignment: .leading, spacing: 6, content: {
                            Text("Greeks Salad")
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            HStack {
                                Text("Only Today")
                                    .foregroundColor(white)
                                Text("10%")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("off")
                                    .foregroundColor(white)
                            }

                            Text("$3.52")
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                        })

                        Spacer(minLength: 5)

                        Image("p2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 170, height: 170)
                    }
                    .padding([.vertical, .leading])
                    .background(
                        LinearGradient(
                            gradient: .init(colors: [Color("g1"), Color("g2")]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .cornerRadius(25)
                        .padding(.vertical, 25)
                        .padding(.trailing, 30)
                    )
                    .padding(.horizontal)

                    Header(title: "Seasonal Salads")
                    .padding()

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 25) {
                            ForEach(items) { item in
                                // Card view
                                CardView(item: item)
                                
                            }
                        }
                        .padding()
                        .padding(.horizontal, 4)
                    }

                    Header(title: "Healthy Offers")
                    .padding()

                    HStack {
                        Image("p2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 170, height: 170)
                            .padding(.trailing)

                        VStack(alignment: .leading, spacing: 6, content: {
                            Text("Fruit Salad")
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Text("@Awesome Price")
                                .foregroundColor(white)

                            Text("$10.82")
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                        })

                        Spacer(minLength: 5)


                    }
                    .padding([.vertical, .trailing])
                    .background(
                        LinearGradient(
                            gradient: .init(colors: [Color("g1"), Color("g2")]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .cornerRadius(25)
                        .padding(.vertical, 25)
                        .padding(.leading, 30)
                    )
                    .padding(.horizontal)
                }
                .padding(.bottom, 100)
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
