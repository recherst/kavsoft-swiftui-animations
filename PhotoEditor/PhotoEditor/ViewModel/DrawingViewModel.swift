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
    

    // Cancel function
    func cancelImageEditing() {
        imageData = Data(count: 0)
        canvas = PKCanvasView()
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
        textBoxes.removeLast()
    }
}
