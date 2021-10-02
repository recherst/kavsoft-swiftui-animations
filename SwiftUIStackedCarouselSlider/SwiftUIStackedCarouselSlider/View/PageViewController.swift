//
//  PageViewController.swift
//  SwiftUIStackedCarouselSlider
//
//  Created by recherst on 2021/10/2.
//

import SwiftUI

struct PageViewController: UIViewRepresentable {
    var total: Int
    @Binding var current: Int
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.numberOfPages = total
        view.currentPage = current
        view.currentPageIndicatorTintColor = .white
        view.preferredIndicatorImage = UIImage(systemName: "book.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
        view.backgroundStyle = .prominent
        return view
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = current
    }
}

