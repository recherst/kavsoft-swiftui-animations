//
//  HomeViewModel.swift
//  MultipleImageViewer
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {

    // Replace with your image model
    @Published var allImages: [String] = ["image1", "image2", "image3", "image4", "image5", "image6"]

    // Properties for image viewer
    @Published var showImageViewer = false

    @Published var selectedImageID: String = ""

    @Published var imageViewerOffset: CGSize = .zero

    // BG opacity
    @Published var bgOpacity: Double = 1

    // Scale
    @Published var imageScale: CGFloat = 1

    func onChange(value: CGSize) {
        // Update offset
        imageViewerOffset = value

        // Calculate opacity
        let halfHeight = UIScreen.main.bounds.height / 2
        let progress = imageViewerOffset.height / halfHeight

        withAnimation(.default) {
            bgOpacity = Double(1 - (progress < 0 ? -progress : progress))
        }
    }

    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeInOut) {
            var translation = value.translation.height
            if translation < 0 {
                translation = -translation
            }
            if translation < 250 {
                imageViewerOffset = .zero
                bgOpacity = 1
            } else {
                showImageViewer.toggle()
                imageViewerOffset = .zero
                bgOpacity = 1
            }
        }
    }
}


