//
//  CustomNavigationView.swift
//  NavigationSearchBar
//
//  Created by recherst on 2021/9/11.
//

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {

    var view: Home
    func makeUIViewController(context: Context) -> UINavigationController {
        let childView = UIHostingController(rootView: view)

        let controller = UINavigationController(rootViewController: childView)

        // Nav bar data
        controller.navigationBar.topItem?.title = "Kavsoft"
        controller.navigationBar.prefersLargeTitles = true

        // Search bar
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Apps, Games"
        // Setting search bar in navbar
        // Disable hide on scroll
        // Disable dim bg
        searchController.obscuresBackgroundDuringPresentation = false
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController

        return controller
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {

    }
}

