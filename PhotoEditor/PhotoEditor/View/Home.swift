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
                    .font(.system(size: 35, weight: model.textBoxes[model.currentIndex].isBold ? .bold : .regular))
                    .colorScheme(.dark)
                    .foregroundColor(model.textBoxes[model.currentIndex].textColor)
                    .padding()

                // Add and cancel button
                HStack {
                    Button(action: {
                        // toggle the isAdded
                        model.textBoxes[model.currentIndex].isAdded = true
                        // Closing the view
                        model.toolPicker.setVisible(true, forFirstResponder: model.canvas)
                        model.canvas.becomeFirstResponder()
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
                    HStack(spacing: 15) {
                        ColorPicker("", selection: $model.textBoxes[model.currentIndex].textColor)
                            .labelsHidden()

                        Button(action: {
                            model.textBoxes[model.currentIndex].isBold.toggle()
                        }, label: {
                            Text(model.textBoxes[model.currentIndex].isBold ? "Normal" : "Bold")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        })
                    }
                )
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        // Show image picker to pick image
        .sheet(isPresented: $model.showImagePicker) {
            ImagePicker(showPicker: $model.showImagePicker, imageData: $model.imageData)
        }
        .alert(isPresented: $model.showAlert) {
            Alert(
                title: Text("Message"),
                message: Text(model.message),
                dismissButton: .destructive(Text("OK"))
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
