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
}


