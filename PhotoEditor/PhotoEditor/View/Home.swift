//
//  Home.swift
//  PhotoEditor
//
//  Created by recherst on 2021/8/1.
//

import SwiftUI

struct Home: View {

    @StateObject var model = DrawingViewModel()

    var body: some View {
        // Home screen
        NavigationView {
            VStack {
                if let imageFile = UIImage(data: model.imageData) {
                    Image(uiImage: imageFile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    // Setting cancel button if image selected
                        .toolbar(content: {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: model.cancelImageEditing) {
                                    Image(systemName: "xmark")
                                }
                            }
                        })

                } else {
                    // Show image picker button
                    Button(action: {
                        model.showImagePicker.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width: 70, height: 70)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: -5)
                    })
                }
            }
            .navigationTitle("Image Editor")
        }
        // Show image picker to pick image
        .sheet(isPresented: $model.showImagePicker) {
            ImagePicker(showPicker: $model.showImagePicker, imageData: $model.imageData)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
