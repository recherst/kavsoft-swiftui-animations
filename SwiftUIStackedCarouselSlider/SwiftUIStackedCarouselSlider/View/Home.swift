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
    @State var swiped = 0

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
                                .aspectRatio(contentMode: .fit)
                                .frame(width: width, height: getHeight(index: book.id))
                                .background(Color.black)
                                .cornerRadius(25)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5)

                            // Read more button
                            CardView(card: book)
                                .frame(width: width, height: getHeight(index: book.id))
                        }

                        Spacer(minLength: 0)
                    }
                    // Content shape for drag gesture
                    .contentShape(Rectangle())
                    .padding(.horizontal, 20)
                    .offset(x: book.id - swiped < 3 ? CGFloat(book.id - swiped) * 30 : 60)
                    .offset(x: book.offset)
                    // Gesture
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation {
                                    onScroll(value: value.translation.width, index: book.id)
                                }
                            })
                            .onEnded({ value in
                                withAnimation {
                                    onEnd(value: value.translation.width, index: book.id)
                                }
                            })
                    )
                }
            }
            .frame(height: height)

            PageViewController(total: books.count, current: $swiped)
                .padding(.top, 25)

            Spacer(minLength: 0)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
    }

    // Dynamic height change
    func getHeight(index: Int) -> CGFloat {
        // Two card  = 80
        // All other are 80 at background
        // Automatic height and offset adjusting
        return height - (index - swiped < 3 ? CGFloat(index - swiped) * 40 : 80)
    }

    func onScroll(value: CGFloat, index: Int) {
        if value < 0 {
            // Left swipe
            if index != books.last!.id {
                books[index].offset = value
            }
        } else {
            // Right Swipe
            // Safe Check
            if index > 0 {
                books[index - 1].offset = -(width + 60) + value
            }
        }
    }

    func onEnd(value: CGFloat, index: Int) {
        if value < 0 {
            if -value > width / 2 && index != books.last!.id {
                books[index].offset = -(width + 60)
                swiped += 1
            } else {
                books[index].offset = 0
            }
        } else {
            if index > 0 {
                if value > width / 2 {
                    books[index - 1].offset = 0
                    swiped -= 1
                } else {
                    books[index - 1].offset = -(width + 60)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
