//
//  HeaderViewModel.swift
//  AnimatedHeader
//
//  Created by recherst on 2021/8/25.
//

import SwiftUI

class HeaderViewModel: ObservableObject {

    // To capture start minY value for calculations
    @Published var startMinY: CGFloat = 0

    @Published var offset: CGFloat = 0

    // Header view properties
    @Published var headerOffset: CGFloat = 0
    // It will be used for getting top and bottom offset for header view
    @Published var topScrollOffset: CGFloat = 0
    @Published var bottomScrollOffset: CGFloat = 0
}
