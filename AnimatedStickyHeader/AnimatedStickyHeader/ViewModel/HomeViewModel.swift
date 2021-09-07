//
//  HomeViewModel.swift
//  AnimatedStickyHeader
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var offset: CGFloat = 0

    @Published var selectedTab = tabsItems.first!.tab
}
