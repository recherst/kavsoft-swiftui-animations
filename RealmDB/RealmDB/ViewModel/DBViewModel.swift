//
//  DBViewModel.swift
//  RealmDB
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

class DBViewModel: ObservableObject {
    @Published var title = ""
    @Published var detail = ""

    @Published var openNewPage = false
}
