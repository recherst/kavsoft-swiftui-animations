//
//  Detail.swift
//  ECommerceAppUI
//
//  Created by recherst on 2021/9/13.
//

import SwiftUI

struct Detail: View {
    @Binding var selectedItem: Item
    @Binding var show: Bool

    var animation: Namespace.ID
    @State var loadContent = false

    @State var selectedColor = Color("p1")

    var body: some View {
        // Optimisation for smaller size iphone
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), content: {
            VStack {
                HStack(spacing: 25) {

                    Button(action: {
                        // Close view
                        withAnimation(.spring()) {
                            show.toggle()
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                    Spacer()

                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    })

                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "bag")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                }
                .padding()

                VStack(spacing: 10) {
                    Image(selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                        .padding()

                    Text(selectedItem.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)

                    Text(selectedItem.subTitle)
                        .foregroundColor(.gray)
                        .padding(.top, 4)

                    HStack {
                        Text(selectedItem.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)

                        Spacer()

                        Button(action: {}, label: {
                            Image(systemName: "suit.heart")
                                .font(.title2)
                                .foregroundColor(.black)
                        })
                        .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                    }
                    .padding()
                }
                .padding(.top, 35)
                .background(
                    Color(selectedItem.image)
                        .clipShape(CustomShape())
                        .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
                )
                .cornerRadius(15)
                .padding()

                // Delay loading the content for smooth animation
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Exclusive Offer")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)

                        Text("Frame  + Lens for $35(it's 50% off)")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                    .background(Color("p3"))
                    .cornerRadius(15)

                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Color")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)

                        HStack(spacing: 15) {
                            ForEach(1...4, id: \.self) { index in
                                ZStack {
                                    Color("p\(index)")
                                        .clipShape(Circle())
                                        .frame(width: 45, height: 45)
                                        .onTapGesture {
                                            withAnimation {
                                                selectedColor = Color("p\(index)")
                                            }
                                        }

                                    // checkmark for selected one
                                    if selectedColor == Color("p\(index)") {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.black)
                                    }
                                }
                            }

                            Spacer(minLength: 0)
                        }
                    })
                    .padding()

                    Spacer(minLength: 15)

                    Button(action: {}, label: {
                        Text("TRY FRAME IN 30")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .cornerRadius(15)
                    })

                    Button(action: {}, label: {
                        Text("ADD TO CART")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color.black)
                            .cornerRadius(15)
                    })
                    .padding(.vertical)

                }
                .padding([.horizontal, .bottom])
                .frame(height: loadContent ? nil : 0)
                .opacity(loadContent ? 1 : 0)
                // For smooth transition

                Spacer(minLength: 0)
            }
        })
        .onAppear(perform: {
            withAnimation(Animation.spring().delay(0.45)) {
                loadContent.toggle()
            }
        })
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
