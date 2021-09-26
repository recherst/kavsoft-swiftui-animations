//
//  FilteredImage.swift
//  Filter
//
//  Created by recherst on 2021/9/26.
//

import SwiftUI
import CoreImage

struct FilteredImage: Identifiable {

    var id = UUID().uuidString
    var image: UIImage
    var filter: CIFilter
    var isEditable: Bool
}
