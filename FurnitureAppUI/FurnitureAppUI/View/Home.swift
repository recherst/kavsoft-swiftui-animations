//
//  Home.swift
//  FurnitureAppUI
//
//  Created by recherst on 2021/9/19.
//

import SwiftUI

struct Home: View {
    @State var size = "Medium"
    @State var currentTab = "All"

    @State var items = [
        Item(
            title: "Stylish Table Lamp",
            price: "$20.00",
            subTitle: "We have amazing quality Lamp wide range.",
            image: "lamp"
        ),
        Item(
            title: "Modern Chair",
            price: "$60.00",
            subTitle: "New style of tables for your home and office.",
            image: "chair"
        ),
        Item(
            title: "Wodden Stool",
            price: "$35.00",
            subTitle: "Amazing stylish in multiple Most selling item of this.",
            image: "stool"
        )
    ]

    @GestureState var isDragging = false

    // Add cart items
    @State var cart: [Item] = []
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.black)
                })

                Spacer()

                Button(action: {}, label: {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                })
                .overlay(
                    // Cart count
                    Text("\(cart.count)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .frame(width: 20, height: 20)
                        .background(Color("tab"))
                        .clipShape(Circle())
                        .offset(x: 15, y: -22)
                        // Disable if no items
                        .opacity(cart.isEmpty ? 0 : 1)
                )
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 10)

            ScrollView {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text("Furniture in \nUnique Style")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)

                            Text("WE have wide range of furnitures")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                        })

                        Spacer(minLength: 15)

                        // Menu button
                        Menu(content: {
                            Button(action: {
                                size = "Small"
                            }, label: {
                                Text("Small")
                            })

                            Button(action: {
                                size = "Medium"
                            }, label: {
                                Text("Small")
                            })

                            Button(action: {
                                size = "Large"
                            }, label: {
                                Text("Large")
                            })
                        }) {
                            Label(title: {
                                Text(size)
                                    .foregroundColor(.white)
                            }) {
                                Image(systemName: "slider.vertical.3")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black)
                            .clipShape(Capsule())
                        }
                    }
                    .padding()

                    HStack(spacing: 0) {
                        ForEach(tabs, id: \.self) { tab in
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab)
                                    .fontWeight(.bold)
                                    .foregroundColor(currentTab == tab ? .black : .gray)
                            })

                            if tab != tabs.last {
                                Spacer(minLength: 0)
                            }
                        }
                    }
                    .padding()

                    ForEach(items.indices) { index in
                        ZStack {

                            Color("tab")
                                .cornerRadius(20)

                            Color("Color")
                                .cornerRadius(20)
                                .padding(.trailing, 65)

                            HStack {
                                Spacer()

                                Button(action: {}, label: {
                                    Image(systemName: "suit.heart")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 65)
                                })

                                Button(action: {
                                    addCart(index: index)
                                }, label: {
                                    Image(systemName: checkCart(index: index) ? "cart.badge.minus" : "cart.badge.plus")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 65)
                                })
                            }

                            CardView(item: items[index])
                                .offset(x: items[index].offset)
                                .gesture(
                                    DragGesture()
                                        .updating($isDragging, body: { value, state, _ in
                                            // So we can validate for correct drag
                                            state = true
                                            onChanged(value: value, index: index)
                                        })
                                        .onEnded({ value in
                                            onEnd(value: value, index: index)
                                        })
                                )
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }

    // Check cart and add items
    func checkCart(index: Int) -> Bool {
        cart.contains { items[index].id == $0.id }
    }

    func addCart(index: Int) {
        if checkCart(index: index) {
            cart.removeAll { $0.id == items[index].id }
        } else {
            cart.append(items[index])
        }

        // Close after added
        withAnimation {
            items[index].offset = 0
        }
    }

    func onChanged(value: DragGesture.Value, index: Int) {
        if value.translation.width < 0 && isDragging {
            items[index].offset = value.translation.width
        }
    }

    // onEnd is not working properly
    // Maybe its a bug
    // To avoid this we use update property on Drag gesture
    func onEnd(value: DragGesture.Value, index: Int) {
        withAnimation {
            // 65 + 65 = 130
            if -value.translation.width >= 100 {
                items[index].offset = -130
            } else {
                items[index].offset = 0
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


var tabs = ["Tables", "Chairs", "Lamps", "All"]
