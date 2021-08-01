//
//  DrawingViewModel.swift
//  PhotoEditor
//
//  Created by recherst on 2021/8/1.
//

import SwiftUI
import PencilKit

// It holds all our drawing data
class DrawingViewModel: ObservableObject {

    @Published var showImagePicker = false
    @Published var imageData: Data = Data(count: 0)

    // Canvas for drawing
    @Published var canvas = PKCanvasView()

    /// Tool picker
    @Published var toolPicker = PKToolPicker()

    // List of TextBoxes
    @Published var textBoxes = [TextBox]()

    @Published var addNewBox = false

    // Current index
    @Published var currentIndex: Int = 0

    // Save the view frame size
    @Published var rect: CGRect = .zero

    // Show Alert
    @Published var showAlert = false
    @Published var message = ""
    

    // Cancel function
    func cancelImageEditing() {
        imageData = Data(count: 0)
        canvas = PKCanvasView()
        textBoxes.removeAll()
    }

    // Cancel the text view
    func cancelTextView() {
        // Show again the tool bar
        toolPicker.setVisible(true, forFirstResponder: canvas)
        canvas.becomeFirstResponder()

        withAnimation {
            addNewBox = false
        }

        // Remove if cancelled
        // Avoiding the removal of already added
        if !textBoxes[currentIndex].isAdded {
            textBoxes.removeLast()
        }
    }

    func saveImage() {
        // Generate image from both canvas and our textboxes view
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        // Canvas
        canvas.drawHierarchy(in: CGRect(origin: .zero, size: rect.size), afterScreenUpdates: true)
        // Draw text boxes
        let SwiftUIView = ZStack {
            ForEach(textBoxes) { [self] textBox in
                Text(
                    textBoxes[currentIndex].id == textBox.id && addNewBox
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
            }
        }
        let controller = UIHostingController(rootView: SwiftUIView).view!
        controller.frame = rect
        // Clear background color
        controller.backgroundColor = .clear
        canvas.backgroundColor = .clear
        controller.drawHierarchy(in: CGRect(origin: .zero, size: rect.size), afterScreenUpdates: true)
        // Get image
        let generatedImage = UIGraphicsGetImageFromCurrentImageContext()
        // End render
        UIGraphicsEndImageContext()

        if let image = generatedImage?.pngData() {
            // save image as PNG to photo library
            UIImageWriteToSavedPhotosAlbum(UIImage(data: image)!, nil, nil, nil)
            print("success...")
            message = "Saved successfully!"
            showAlert.toggle()
        }
    }
}
