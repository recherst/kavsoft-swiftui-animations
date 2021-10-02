//
//  Home.swift
//  SwiftUIStackedCarouselSlider
//
//  Created by recherst on 2021/10/2.
//

import SwiftUI

struct Home: View {
    // 40 = padding horizontal
    // 60 = 2 card to right side
    var width = UIScreen.main.bounds.width - (40 + 60)
    var height = UIScreen.main.bounds.height / 2

    @State var books = [
        // Make sure id is in ascending order
        Book(id: 0, image: "p1", title: "The Murder of Roger Ackroyd", anthor: "Agatha Christie", rating: 3, offset: 0),
        Book(id: 1, image: "p0", title: "The Hound of the Baskervilles", anthor: "Arthur Conan", rating: 4, offset: 0),
        Book(id: 2, image: "p3", title: "The Gril with the Dragon Tattoo", anthor: "Stieg Larsson", rating: 4, offset: 0),
        Book(id: 3, image: "p2", title: "The Godfather", anthor: "Mario Puzo", rating: 5, offset: 0),
        Book(id: 4, image: "p5", title: "The Lovely Bones", anthor: "Alice Sebold", rating: 4, offset: 0),
        Book(id: 5, image: "p4", title: "Rebecca", anthor: "Daphne Du Maurier", rating: 4, offset: 0)
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Custom Carousel")
                    .font(.title)
                    .fontWeight(.heavy)

                Spacer(minLength: 0)

                Button(action: {}, label: {
                    Image(systemName: "circle.grid.2x2.fill")
                        .font(.system(size: 22))

                })
            }
            .foregroundColor(.white)
            .padding()

            Spacer(minLength: 0)

            ZStack {
                // Since its zstack it overlay one on another so reversed
                ForEach(books.reversed()) { book in
                    HStack {
                        ZStack {
                            Image(book.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width, height: getHeight(index: book.id))
                                .background(Color.black)
                                .cornerRadius(25)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5)

                            // Read more button
                            
                        }

                        Spacer(minLength: 0)
                    }
                    // Content shape for drag gesture
                    .contentShape(Rectangle())
                    .padding(.horizontal, 20)
                    .offset(x: book.id < 3 ? CGFloat(book.id) * 30 : 60)
                }
            }

            Spacer(minLength: 0)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
    }

    // Dynamic height change
    func getHeight(index: Int) -> CGFloat {
        // Two card  = 80
        // All other are 80 at background
        return height - (index < 3 ? CGFloat(index) * 40 : 80)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
