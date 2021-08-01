//
//  DrawingViewModel.swift
//  PhotoEditor
//
//  Created by recherst on 2021/8/1.
//

import SwiftUI

// It holds all our drawing data
class DrawingViewModel: ObservableObject {

    @Published var showImagePicker = false
    @Published var imageData: Data = Data(count: 0)

    func cancelImageEditing() {
        imageData = Data(count: 0)
    }
}
