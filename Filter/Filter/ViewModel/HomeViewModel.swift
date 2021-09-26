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

    // Main Editing image
    @Published var mainView: FilteredImage!

    // Slider for intensity and radius etc.
    // Since we didn't set while reading image
    // So all will be full value
    @Published var value: CGFloat = 1.0

    // Load filteredOption whenever image is selected
    let filters: [CIFilter] = [
        CIFilter.sepiaTone(),
        CIFilter.comicEffect(),
        CIFilter.colorInvert(),
        CIFilter.photoEffectFade(),
        CIFilter.colorMonochrome(),
        CIFilter.photoEffectChrome(),
        CIFilter.gaussianBlur(),
        CIFilter.bloom()
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

                let isEditable = filter.inputKeys.count > 1

                let filteredData = FilteredImage(
                    image: UIImage(cgImage: cgImage!),
                    filter: filter,
                    isEditable: isEditable
                )

                DispatchQueue.main.async {
                    self.allImages.append(filteredData)

                    // default is first filter
                    if self.mainView == nil {
                        self.mainView = self.allImages.first
                    }
                }
            }
        }
    }

    func updateEffect() {
        let context = CIContext()

        DispatchQueue.global(qos: .userInteractive).async {
            // Load image into filter
            let ciImage = CIImage(data: self.imageData)

            let filter = self.mainView.filter

            filter.setValue(ciImage!, forKey: kCIInputImageKey)

            // Retreve image

            // There are lot of custom options are available
            // I'm only using radius and intensity
            // Use your own based on your usage

            // Radius you can give up to 100
            // I'm using only 10
            if filter.inputKeys.contains("inputRadius") {
                filter.setValue(self.value * 10, forKey: kCIInputRadiusKey)
            }
            if filter.inputKeys.contains("inputIntensity") {
                filter.setValue(self.value, forKey: kCIInputIntensityKey)
            }

            guard let newImage = filter.outputImage else { return }

            // Create UIImage
            let cgImage = context.createCGImage(newImage, from: newImage.extent)

            DispatchQueue.main.async {
                // Update view
                self.mainView.image = UIImage(cgImage: cgImage!)
            }
        }
    }
}
