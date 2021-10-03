//
//  Home.swift
//  NikeApp
//
//  Created by recherst on 2021/10/3.
//

import SwiftUI

struct Home: View {
    var black = Color.black.opacity(0.7)
    var width = UIScreen.main.bounds.width
    @State var more = false
    @State var gender = "Male"
    @State var size = 6
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var added = false

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color("red"))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    })

                    Spacer(minLength: 0)

                    Button(action: {}, label: {
                        Image(systemName: "suit.heart")
                            .font(.system(size: 22))
                            .foregroundColor(black)
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    })
                }

                Image("nike")
                    .resizable()
                    // 200 * 72
                    .frame(width: 30, height: 30 * 72 / 200)
            }
            .padding()

            Image("shoe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width - (more ? 200 : 100))
                .padding(.top, 25)

            // For smaller iPhones
            ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                VStack {
                    HStack {
                        Text("Nike Air Huarache For Women")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(black)

                        Spacer(minLength: 0)

                        Text("$168")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("red"))
                    }
                    .padding(.top, 25)
                    .padding(.trailing)

                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("The Nike Air Huarache '07 WW is the b-ball OG with the look you know best: crisp leather, bold colours and the perfect amount of flash to make you shine. Featuring Nike worldwide graphics throughout, it lets you celebrate the unity of sport in legendary style.")
                            .lineLimit(more ? nil : 3)
                            .foregroundColor(black)

                        Button(action: {
                            withAnimation {
                                more.toggle()
                            }
                        }, label: {
                            Text("Read More")
                                .fontWeight(.bold)
                                .foregroundColor(Color("red"))
                        })
                    })
                    .padding([.vertical, .trailing])

                    HStack(spacing: 15) {
                        Text("Gender")
                            .fontWeight(.heavy)
                            .foregroundColor(black)
                            .frame(width: 75, alignment: .leading)

                        GenderButton(gender: $gender, title: "Male")

                        GenderButton(gender: $gender, title: "Female")

                        Spacer(minLength: 0)
                    }
                    .padding(.trailing)
                    .padding(.top, 10)

                    HStack(spacing: 15) {
                        Text("Size")
                            .fontWeight(.heavy)
                            .foregroundColor(black)
                            .frame(width: 75, alignment: .leading)

                        ForEach(sizes, id: \.self) { title in
                            SizeButton(size: $size, title: title)
                        }

                        Spacer(minLength: 0)
                    }
                    .padding(.trailing)
                    .padding(.top, 10)

                    Spacer(minLength: 0)

                    Button(action: {
                        added.toggle()
                    }, label: {
                        Label(
                            title: {
                                Text(added ? "Added" : "Add to Bag")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                            },
                            icon: {
                                Image(systemName: added ? "checkmark.circle.fill" : "cart.fill")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                            }
                        )
                        .padding(.vertical, 12)
                        // Padding 35 + 40 = 75
                        .frame(width: width - 75)
                        .background(added ? Color.green : Color("red"))
                        .clipShape(Capsule())
                        .padding(.leading, -45)
                        .padding(.top)
                        .padding(.bottom, edges!.bottom == 0 ? 15 : edges!.bottom)
                    })
                }
                .padding(.leading, 45)
            })
            .background(Color.white)
            // it's asking something here I don't know maybe its bug
            .shadow(radius: 0)
            .clipShape(CustomShape())
            .padding(.top, 30)
            .shadow(color: Color.black.opacity(0.12), radius: 5, x: -5, y: -10)
        }
        .background(Color("bg").ignoresSafeArea())
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var sizes = [6, 7, 8, 9, 10]
