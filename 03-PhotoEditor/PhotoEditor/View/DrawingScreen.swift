//
//  DrawingScreen.swift
//  PhotoEditor
//
//  Created by recherst on 2021/8/1.
//

import SwiftUI
import PencilKit

struct DrawingScreen: View {
    @EnvironmentObject var model: DrawingViewModel
    var body: some View {
        ZStack {
            GeometryReader { geometry -> AnyView in
                let rect = geometry.frame(in: .global)
                DispatchQueue.main.async {
                    if model.rect == .zero {
                        model.rect = rect
                    }
                }
                return AnyView(
                    ZStack {
                        // UIKit Pencil Kit Drawing View
                        CanvasView(
                            canvas: $model.canvas,
                            imageData: $model.imageData,
                            toolPicker: $model.toolPicker,
                            rect: rect.size
                        )
                        // Custom texts

                        // Display text boxes
                        ForEach(model.textBoxes) { textBox in
                            Text(
                                model.textBoxes[model.currentIndex].id == textBox.id && model.addNewBox
                                    ? ""
                                    : textBox.text
                            )
                            // You can also include text size in model
                            // and can use those text sizes in these
                            // text boxes...
                            .font(.system(size: 30))
                            .fontWeight((textBox.isBold ? .bold : .none))
                            .foregroundColor(textBox.textColor)
                            .offset(textBox.offset)
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        let current = value.translation
                                        // Add with last offset
                                        let lastOffset = textBox.lastOffset
                                        let newTranslation = CGSize(
                                            width: lastOffset.width + current.width,
                                            height: lastOffset.height + current.height
                                        )

                                        model.textBoxes[getIndex(textBox: textBox)].offset = newTranslation
                                    })
                                    .onEnded({ value in
                                        // Save the last offset for exact drag position
                                        model.textBoxes[getIndex(textBox: textBox)].lastOffset = value.translation
                                    })
                            )
                            .onLongPressGesture {
                                // Closing the toobar
                                model.toolPicker.setVisible(false, forFirstResponder: model.canvas)
                                model.canvas.resignFirstResponder()

                                model.currentIndex = getIndex(textBox: textBox)
                                withAnimation {
                                    model.addNewBox = true
                                }
                            }

                        }
                    }
                )
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: model.saveImage) {
                    Text("Save")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Create one new box
                    model.textBoxes.append(TextBox())

                    // Update index
                    model.currentIndex = model.textBoxes.count - 1

                    withAnimation {
                        model.addNewBox.toggle()
                    }
                    // Closing the tool bar
                    model.toolPicker.setVisible(false, forFirstResponder: model.canvas)
                    model.canvas.resignFirstResponder()
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
    }

    func getIndex(textBox: TextBox) -> Int {
        model.textBoxes.firstIndex { $0.id == textBox.id } ?? 0
    }
}

struct DrawingScreen_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CanvasView: UIViewRepresentable {

    // Since we need to get the drawing so were binding
    @Binding var canvas: PKCanvasView
    @Binding var imageData: Data
    @Binding var toolPicker: PKToolPicker

    // View size
    var rect: CGSize

    func makeUIView(context: Context) -> PKCanvasView {
        canvas.isOpaque = false
        canvas.backgroundColor = .clear
        canvas.drawingPolicy = .anyInput

        // Appending the image in canvas subview
        if let image = UIImage(data: imageData) {
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(origin: .zero, size: rect)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true

            // Basically, we're setting image to the back of the canvas
            let subview = canvas.subviews.first
            subview?.addSubview(imageView)
            subview?.sendSubviewToBack(imageView)

            // showing tool picker

            // We're setting it as first responder and making it as visible
            toolPicker.setVisible(true, forFirstResponder: canvas)
            toolPicker.addObserver(canvas)
            canvas.becomeFirstResponder()
        }

        return canvas
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // Update UI will update for each actions

    }
}
