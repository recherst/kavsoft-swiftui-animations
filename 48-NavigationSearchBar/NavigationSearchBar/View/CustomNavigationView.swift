//
//  CustomNavigationView.swift
//  NavigationSearchBar
//
//  Created by recherst on 2021/9/11.
//

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {

    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }

    var view: AnyView

    // Ease of use
    var largeTitle: Bool
    var title: String
    var placeHolder: String

    // onSearch and onCancel Closures
    var onSearch: (String) -> Void
    var onCancel: () -> Void

    // Requre closure on Call
    init(
        view: AnyView,
        placeHolder: String? = "Search",
        largeTitle: Bool? = true,
        title: String,
        onSearch: @escaping (String) -> Void,
        onCancel: @escaping () -> Void
    ) {
        self.placeHolder = placeHolder!
        self.largeTitle = largeTitle!
        self.title = title
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }

    func makeUIViewController(context: Context) -> UINavigationController {
        let childView = UIHostingController(rootView: view)

        let controller = UINavigationController(rootViewController: childView)

        // Nav bar data
        controller.navigationBar.topItem?.title = title
        controller.navigationBar.prefersLargeTitles = largeTitle

        // Search bar
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeHolder
        // Set delegate
        searchController.searchBar.delegate = context.coordinator

        // Disable dim bg
        searchController.obscuresBackgroundDuringPresentation = false
        // Disable hide on scroll
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        // Setting search bar in navbar
        controller.navigationBar.topItem?.searchController = searchController

        return controller
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update read time
        uiViewController.navigationBar.topItem?.title = title
        uiViewController.navigationBar.topItem?.searchController?.searchBar.placeholder = placeHolder
        uiViewController.navigationBar.prefersLargeTitles = largeTitle
    }

    // Search bar delegate
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: CustomNavigationView

        init(parent: CustomNavigationView) {
            self.parent = parent
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // When text changes
            parent.onSearch(searchText)
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            // When cancel button is clicked
            parent.onCancel()
        }
    }
}

