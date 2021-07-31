//
//  PageControl.swift
//  CustomCarouselSlider
//
//  Created by recherst on 2021/7/31.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var maxPages: Int
    var currentPage: Int
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.backgroundStyle = .minimal
        control.numberOfPages = maxPages
        control.currentPage = currentPage
        return control
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

