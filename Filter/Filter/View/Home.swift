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
            if !homeData.allImages.isEmpty {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 20) {
                        ForEach(homeData.allImages) { filteredImage in
                            Image(uiImage: filteredImage.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
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
        .onChange(of: homeData.imageData, perform: { _ in
            // When ever image is changed firing loadImage

            // Clear exsiting data
            homeData.allImages.removeAll()
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
