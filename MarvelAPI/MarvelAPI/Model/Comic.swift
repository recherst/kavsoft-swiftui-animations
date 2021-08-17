//
//  Comic.swift
//  MarvelAPI
//
//  Created by recherst on 2021/8/18.
//

import SwiftUI


struct APIComicResult: Codable {
    var data: APIComicData
}

struct APIComicData: Codable {
    var count: Int
    var results: [Comic]
}

struct Comic: Identifiable, Codable {
    var id: Int
    var title: String
    var description: String?
    var urls: [[String: String]]
    var thumbnail: [String: String]
}
