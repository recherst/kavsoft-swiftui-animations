//
//  Home.swift
//  CustomCarouselSlider
//
//  Created by recherst on 2021/7/31.
//

import SwiftUI

struct Home: View {
    // To capture the current tab
    @State var selectedTab: Trip = trips[0]

    // Disabling bounce...
    init() {
        UIScrollView.appearance().bounces = false
    }
    var body: some View {
        ZStack {
            // To get screen size for image...
            GeometryReader { geometry in
                let frame = geometry.frame(in: .global)

                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height, alignment: .center)
                    // Why we using corner radius
                    // because image in SwiftUI using .fill
                    // will require corner radius or clipShape
                    // to cut the image...
                    .cornerRadius(0)
            }
            .ignoresSafeArea()

            // Custom carousel
            VStack {
                Text("Let's Go With")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Pocotrip")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)

                // Carousel
                VStack {
                    GeometryReader { geometry in
                        let frame = geometry.frame(in: .global)

                        // Page tab view...
                        TabView(selection: $selectedTab) {
                            ForEach(trips) { trip in
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(
                                        width: frame.width - 10,
                                        height: frame.height,
                                        alignment: .center
                                    )
                                    .cornerRadius(4)
                                    .tag(trip)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    // max limit
                    // half of the screen
                    .frame(height: UIScreen.main.bounds.height / 2.2)

                    Text(selectedTab.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.bottom, 18)

                    // Page control from UIKit
                    PageControl(maxPages: trips.count, currentPage: index)
                }
                .padding(.top)
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                .background(
                    Color.white
                        .clipShape(CustomShape())
                        .cornerRadius(10)   
                )
                .padding(.horizontal, 20)

                Button(action: {}, label: {
                    Text("GET STARTED")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .background(Color("blue"))
                        .cornerRadius(10)
                })
                .padding(.top, 30)
                .padding(.horizontal)
            }
            .padding()
        }
    }

    /// Getting index...
    var index: Int {
        trips.firstIndex { $0.id == selectedTab.id } ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
