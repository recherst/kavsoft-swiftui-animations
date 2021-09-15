//
//  DetailViewModel.swift
//  AppStoreAnimations
//
//  Created by recherst on 2021/9/15.
//

import SwiftUI

class DetailViewModel: ObservableObject {

    @Published var selectedItem = TodayItem(title: "", category: "", overlay: "", contentImage: "", logo: "")

    @Published var show = false
}

