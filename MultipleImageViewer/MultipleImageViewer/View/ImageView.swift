//
//  ImageView.swift
//  MultipleImageViewer
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

struct ImageView: View {
    @EnvironmentObject var homeData: HomeViewModel
    // Since onChange has a problem in drag gesture
    @GestureState var draggingOffset: CGSize = .zero
    var body: some View {
        ZStack {
            // Tab view has a problem in ignore edges
            ScrollView(.init()) {
                TabView(selection: $homeData.selectedImageID, content:  {
                    ForEach(homeData.allImages, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(image)
                            .scaleEffect(homeData.selectedImageID == image ? (homeData.imageScale > 1 ? homeData.imageScale : 1) : 1)
                            // Move only image for smooth animation
                            .offset(y: homeData.imageViewerOffset.height)
                            .gesture(
                                // Magnify gesture
                                MagnificationGesture()
                                    .onChanged({ value in
                                        homeData.imageScale = value
                                    })
                                    .onEnded({ _ in
                                        withAnimation(.spring()) {
                                            homeData.imageScale = 1
                                        }
                                    })
                                    // Double to zoom
                                    .simultaneously(with: TapGesture(count: 2).onEnded({ _ in
                                        withAnimation {
                                            homeData.imageScale = homeData.imageScale > 1 ? 1 : 4
                                        }
                                    }))
                            )
                    }
                })
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .overlay(
                    // Close button
                    Button(action: {
                        withAnimation(.default) {
                            // Remove all
                            homeData.showImageViewer.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.35))
                            .clipShape(Circle())
                    })
                    .padding(10)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .opacity(homeData.bgOpacity)

                    , alignment: .topTrailing
                )
            }
            .ignoresSafeArea()
        }
        .gesture(
            DragGesture()
                .updating($draggingOffset, body: { value, outValue, _ in
                    outValue = value.translation
                    homeData.onChange(value: draggingOffset)
                })
                .onEnded(homeData.onEnd(value:))
        )
        .transition(.move(edge: .bottom))
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
