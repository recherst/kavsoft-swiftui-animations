//
//  HomeViewModel.swift
//  Filter
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

class HomeViewModel: ObservableObject {

    @Published var imagePicker = false
    @Published var imageData = Data(count: 0)

    @Published var allImages: [FilteredImage] = []

    // Load filteredOption whenever image is selected
    let filters: [CIFilter] = [
        CIFilter.sepiaTone()
    ]
    func loadFilter() {
        let context = CIContext()
        filters.forEach { filter in
            // To avoid lag do it in background
            DispatchQueue.global(qos: .userInteractive).async {
                // Load image into filter
                let ciImage = CIImage(data: self.imageData)

                filter.setValue(ciImage!, forKey: kCIInputImageKey)

                // Retreve image
                guard let newImage = filter.outputImage else { return }

                // Create UIImage
                let cgImage = context.createCGImage(newImage, from: newImage.extent)

                let filteredData = FilteredImage(image: UIImage(cgImage: cgImage!), filter: filter)

                DispatchQueue.main.async {
                    self.allImages.append(filteredData)
                }
            }
        }
    }
}
