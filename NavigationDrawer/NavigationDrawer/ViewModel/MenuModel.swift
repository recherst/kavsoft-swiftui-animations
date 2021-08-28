//
//  MenuModel.swift
//  NavigationDrawer
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI

class MenuViewModel: ObservableObject {

    // default
    @Published var selectedMenu = "Catalogue"

    @Published var showDrawer = false
}
