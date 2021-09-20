//
//  Card.swift
//  RealmDB
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI
import RealmSwift

class Card: Object, Identifiable {

    @objc dynamic var id: Date = Date()
    @objc dynamic var title = ""
    @objc dynamic var detail = ""
}
