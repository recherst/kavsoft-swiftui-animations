//
//  Home.swift
//  HeroAnimation
//
//  Created by recherst on 2021/10/14.
//

import SwiftUI

struct Home: View {
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var selected: Travel = data[0]
    @State var show = false
    @Namespace var animation
    @State var loadView = false

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
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        show.toggle()
                                        selected = travel
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            loadView.toggle()
                                        }
                                    }
                                }
                                .matchedGeometryEffect(id: travel.id, in: animation)

                            Text(travel.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        })
                    }
                })
                .padding(.horizontal)
            })
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

            // Hero view
            if show {
                VStack {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(selected.image)
                            .resizable()
                            .frame(height: 300)
                            .matchedGeometryEffect(id: selected.id, in: animation)

                        if loadView {
                            HStack {
                                Button {
                                    loadView.toggle()
                                    withAnimation(.spring()) {
                                        show.toggle()
                                    }
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }

                                Spacer()

                                Button {

                                } label: {
                                    Image(systemName: "suit.heart.fill")
                                        .foregroundColor(.red)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }

                            }
                            .padding(.top, 35)
                            .padding(.horizontal)
                        }
                    }

                    // Detail view
                    ScrollView(.vertical, showsIndicators: false) {
                        if loadView {
                            VStack {
                                HStack {
                                    Text(selected.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)

                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)

                                Text("SwiftUI is an innovative, exceptionally simple way to build user interface across all Apple platforms with the power of Swift. Build user interface for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that's easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic suport for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you're ever writen.")
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                                    .padding(.horizontal)

                                HStack {
                                    Text("Reviews")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)

                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)

                                HStack(spacing: 0) {
                                    ForEach(1...5, id: \.self) { i in
                                        Image("p\(i)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .offset(x: -CGFloat(i * 20))
                                    }

                                    Spacer(minLength: 0)

                                    Button(action: {}) {
                                        Text("View All")
                                            .fontWeight(.bold)
                                    }
                                }
                                .padding(.leading, 20)
                                .padding(.top)
                                .padding(.horizontal)

                                // Carousel
                                HStack {
                                    Text("Other Places")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)

                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)

                                TabView {
                                    ForEach(1...6, id: \.self) { i in
                                        if "p\(i)" != selected.image {
                                            Image("p\(i)")
                                                .resizable()
                                                .cornerRadius(15)
                                                .padding(.horizontal)
                                        }
                                    }
                                }
                                .frame(height: 250)
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                .padding(.top)

                                // Button
                                Button(action: {}) {
                                    Text("Book Trip")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical)
                                        .frame(width: UIScreen.main.bounds.width - 150)
                                        .background(Color.blue)
                                        .cornerRadius(15)
                                }
                                .padding(.top, 25)

                            }
                        }
                    }

                }
                .background(Color.white)
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .statusBar(hidden: show)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
