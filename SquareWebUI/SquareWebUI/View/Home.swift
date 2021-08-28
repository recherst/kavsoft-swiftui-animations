//
//  Home.swift
//  SquareWebUI
//
//  Created by recherst on 2021/8/29.
//

import SwiftUI

struct Home: View {
    @State var firstMinY: CGFloat = 0

    @State var minY: CGFloat = 0
    @State var lastMinY: CGFloat = 0
    @State var scale: CGFloat = 0

    // Stop bounces on ScrollView
    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
        VStack(spacing: 0) {
            // HeaderView
            HeaderView()

            ScrollView {
                // Top sticky view
                StickyView(firstMinY: $firstMinY, minY: $minY, lastMinY: $lastMinY, scale: $scale)

                VStack(alignment: .leading, spacing: 15, content: {
                    ForEach(1...5, id: \.self) { _ in
                        Section(
                            header: Text("Build-in SEO Tools")
                                .font(.title)
                                .fontWeight(.bold)
                        ) {
                            Text("Lorem Ipsum is simple dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                        }
                    }
                })
                .padding()
                .padding(.bottom, lastMinY)
                .background(Color.white)
                .offset(y: scale > 0.4 ? minY : lastMinY)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(
            Color("Color")
                .ignoresSafeArea(.all, edges: .all)
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    var rect: CGRect {
        UIScreen.main.bounds
    }
}
