//
//  Home.swift
//  PullToRefresh
//
//  Created by recherst on 2021/9/16.
//

import SwiftUI

struct Home: View {
    // sample data
    @State var arrayData = ["Hello Data 1", "Hello Data 2", "Hello Data 3", "Hello Data 4", "Hello Data 5"]
    @State var refresh = Refresh(started: false, released: false)

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Kavsoft")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)

                Spacer()
            }
            .padding()
            .background(Color.white.ignoresSafeArea(.all, edges: .top))

            Divider()

            ScrollView(.vertical, showsIndicators: false, content: {
                // geometry reader for calculating postion
                GeometryReader { reader -> AnyView in
                    DispatchQueue.main.async {
                        if refresh.startOffset == 0 {
                            refresh.startOffset = reader.frame(in: .global).minY
                        }
                        refresh.offset = reader.frame(in: .global).minY
                        if refresh.offset - refresh.startOffset > 80 && !refresh.started {
                            refresh.started = true
                        }

                        // Check if refresh is started and drag is released
                        if refresh.startOffset == refresh.offset && refresh.started && !refresh.released {
                            withAnimation(Animation.linear) {
                                refresh.released = true
                            }
                            updateData()
                        }
                    }
                    return AnyView(Color.black.frame(width: 0, height: 0))
                }
                .frame(width: 0, height: 0)

                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                    // Arrow and indicator
                    if refresh.started && refresh.released {
                        ProgressView()
                            .offset(y: -35)
                    } else {

                        Image(systemName: "arrow.down")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.gray)
                            .rotationEffect(.init(degrees: refresh.started ? 180 : 0))
                            .offset(y: -25)
                            .animation(.easeIn)
                    }

                    VStack {
                        ForEach(arrayData, id: \.self) { value in
                            HStack {
                                Text(value)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }
                    }
                    .background(Color.white)
                })
                .offset(y: refresh.released ? 40 : -10)
            })
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea())
    }

    func updateData() {
        print("update Data")

        // Delay for smooth animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear) {
                arrayData.append("Updated Data")
                refresh.released = false
                refresh.started = false
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

