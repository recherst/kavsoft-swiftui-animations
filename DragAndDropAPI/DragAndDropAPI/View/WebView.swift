//
//  WebView.swift
//  DragAndDropAPI
//
//  Created by recherst on 2021/9/4.
//

import SwiftUI
import WebKit

// WebView from UIKit

struct WebView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: url))
        view.isUserInteractionEnabled = false
        // Scale web view
        view.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {

    }
}
