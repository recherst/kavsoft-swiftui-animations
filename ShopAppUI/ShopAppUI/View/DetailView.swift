//
//  DetailView.swift
//  ShopAppUI
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI

struct DetailView: View {
    @Binding var bagData: BagModel!
    @Binding var show: Bool
    var animation: Namespace.ID
    @State var selectedColor = Color.red

    @State var count = 0

    @State var isSmallDevice = UIScreen.main.bounds.height < 750

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5, content: {
                    Button(action: {
                        withAnimation(.easeOut) { show.toggle() }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    })

                    Text("Aristocratic hand Bag")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top)

                    Text(bagData.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                })

                Spacer(minLength: 0)

                Button(action: {}, label: {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                })
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 6, content: {
                    Text("Price")
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text(bagData.price)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                })

                Image(bagData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    // hero animation
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            }
            .padding()
            .padding(.top, 10)
            .zIndex(1)

            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Color")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)

                            HStack(spacing: 15) {
                                ColorButton(color: Color(bagData.image), selectedColor: $selectedColor)
                                ColorButton(color: Color.yellow, selectedColor: $selectedColor)
                                ColorButton(color: Color.green, selectedColor: $selectedColor)
                            }
                        }

                        Spacer(minLength: 0)

                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Size")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)

                            Text("12 cm")
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                        })
                    }
                    .padding(.horizontal)

                    Text("Whether you are heading to work or travelling, a trendy handbag or clutch will add as the perfect accessory with your outfit. Carry your daily essentials in style as you have a choice of shopping for bags.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding()

                    HStack(spacing: 20) {
                        Button(action: {
                            if count > 0 {
                                count -= 1
                            }
                        }, label: {
                            Image(systemName: "minus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        })

                        Text("\(count)")
                            .font(.title2)

                        Button(action: {
                            count += 1
                        }, label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        })

                        Spacer()

                        Button(action: {}, label: {
                            Image(systemName: "suit.heart.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(Circle())
                        })
                    }
                    .padding(.horizontal)

                    Spacer(minLength: 0)

                    Button(action: {}, label: {
                        Text("BUY NOW")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color(bagData.image))
                            .clipShape(Capsule())
                    })
                    .padding(.top)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
                })
            }
            .background(
                Color.white
                    .clipShape(CustomCorner())
                    .padding(.top, isSmallDevice ? -60 : -100)
            )
            .zIndex(0)
        }
        .background(Color(bagData.image).ignoresSafeArea(.all, edges: .top))
        .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
        .onAppear(perform: {
            // First color is image or bag color
            selectedColor = Color(bagData.image)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
