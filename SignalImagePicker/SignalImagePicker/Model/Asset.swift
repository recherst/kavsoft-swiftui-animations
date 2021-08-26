//
//  Asset.swift
//  SignalImagePicker
//
//  Created by recherst on 2021/8/26.
//

import SwiftUI
import Photos

struct Asset: Identifiable {
    var id = UUID().uuidString
    var asset: PHAsset
    var image: UIImage
}
