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
                let size = geometry.frame(in: .global).size
                return AnyView(
                    ZStack {
                        // UIKit Pencil Kit Drawing View
                        CanvasView(
                            canvas: $model.canvas,
                            imageData: $model.imageData,
                            toolPicker: $model.toolPicker,
                            rect: size
                        )
                        // Custom texts
                    }
                )
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Text("Save")
                })
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "plus")
                })
            }
        })
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
