//
//  Chip.swift
//  TagListView
//
//  Created by recherst on 2021/9/3.
//

import SwiftUI

struct Chip: Identifiable {

    var id = UUID().uuidString
    var chipText: String
    // To stop auto update
    var isExceeded = false
}
