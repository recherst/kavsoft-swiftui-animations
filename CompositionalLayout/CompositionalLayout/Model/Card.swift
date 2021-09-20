//
//  Card.swift
//  CompositionalLayout
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

struct Card: Identifiable, Decodable, Hashable {
    var id: String
    var downloadUrl: String
    var author: String
}
