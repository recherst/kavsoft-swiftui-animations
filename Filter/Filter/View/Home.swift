//
//  Home.swift
//  Filter
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        VStack {
            if !homeData.allImages.isEmpty && homeData.mainView != nil {

                Spacer(minLength: 0)

                Image(uiImage: homeData.mainView.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)

                Slider(value: $homeData.value)
                    .padding()
                    .opacity(homeData.mainView.isEditable ? 1 : 0)
                    .disabled(homeData.mainView.isEditable ? false : true)

                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 20) {
                        ForEach(homeData.allImages) { filteredImage in
                            Image(uiImage: filteredImage.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                // Update manView
                                // Whenever button tapped
                                .onTapGesture {
                                    // Clear old data
                                    homeData.value = 1.0
                                    homeData.mainView = filteredImage
                                }
                        }
                    }
                    .padding()
                })
            } else if homeData.imageData.count == 0 {
                Text("Pick An Image To Process!!!")
            } else {
                // Load view
                ProgressView()
            }
        }
        .onChange(of: homeData.value, perform: { _ in
            homeData.updateEffect()
        })
        .onChange(of: homeData.imageData, perform: { _ in
            // When ever image is changed firing loadImage

            // Clear exsiting data
            homeData.allImages.removeAll()
            homeData.mainView = nil
            homeData.loadFilter()
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    homeData.imagePicker.toggle()
                }, label: {
                    Image(systemName: "photo")
                        .font(.title2)
                })
            }

            // Save image
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    UIImageWriteToSavedPhotosAlbum(homeData.mainView.image, nil, nil, nil)
                }, label: {
                    Image(systemName: "square.and.arrow.up.fill")
                        .font(.title2)
                })
                // Disable on no image
                .disabled(homeData.mainView == nil ? true : false)
            }
        }
        .sheet(isPresented: $homeData.imagePicker, content: {
            ImagePicker(picker: $homeData.imagePicker, imageData: $homeData.imageData)
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
