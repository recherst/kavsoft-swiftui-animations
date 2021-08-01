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
        ZStack {
            NavigationView {
                VStack {
                    if let _ = UIImage(data: model.imageData) {
                        DrawingScreen()
                            .environmentObject(model)
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

            if model.addNewBox {
                Color.black.opacity(0.75)
                    .ignoresSafeArea()

                // TextField
                TextField("Type here...", text: $model.textBoxes[model.currentIndex].text)
                    .font(.system(size: 35))
                    .colorScheme(.dark)
                    .foregroundColor(model.textBoxes[model.currentIndex].textColor)
                    .padding()

                // Add and cancel button
                HStack {
                    Button(action: {
                        model.toolPicker.setVisible(true, forFirstResponder: model.canvas)
                        model.canvas.becomeFirstResponder()
                        
                        // Closing the view
                        withAnimation {
                            model.addNewBox = false
                        }
                    }, label: {
                        Text("Add")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                    })
                    Spacer()
                    Button(action: model.cancelTextView) {
                        Text("Cancel")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .overlay(
                    ColorPicker("", selection: $model.textBoxes[model.currentIndex].textColor)
                        .labelsHidden()
                )
                .frame(maxHeight: .infinity, alignment: .top)
            }
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
