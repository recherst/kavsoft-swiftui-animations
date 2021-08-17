//
//  Character.swift
//  MarvelAPI
//
//  Created by recherst on 2021/8/17.
//

import SwiftUI

struct APIResult: Codable {
    var data: APICharacterData
}

struct APICharacterData: Codable {
    var count: Int
    var results: [Character]
}

struct Character: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var urls: [[String: String]]
    var thumbnail: [String: String]
}

