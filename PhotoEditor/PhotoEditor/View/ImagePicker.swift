//
//  ImagePicker.swift
//  PhotoEditor
//
//  Created by recherst on 2021/8/1.
//

import SwiftUI

// Building Image Picker using UIKit
struct ImagePicker: UIViewControllerRepresentable {

    @Binding var showPicker: Bool
    @Binding var imageData: Data

    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        // Getting parent view context to update image data
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            // Getting image and close
            if let imageData = (info[.originalImage] as? UIImage)?.pngData() {
                parent.imageData = imageData
                parent.showPicker.toggle()
            }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // closing the view if cancelled
            parent.showPicker.toggle()
        }
    }
}

