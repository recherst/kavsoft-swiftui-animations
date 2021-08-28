//
//  ScrollableTabBar.swift
//  ScrollableTabBar
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI

// We're going to create our own view by using view builder
struct ScrollableTabBar<Content: View>: UIViewRepresentable {
    // to store our SwiftUI View
    var content: Content
    // Get rect to calculate width and height of scrollview
    var rect: CGRect
    // ContentOffset
    @Binding var offset: CGFloat
    // Tabs
    var tabs: [Any]
    // For paging AKA scrollable tabs
    var scrollView = UIScrollView()

    init(tabs: [Any],
         rect: CGRect,
         offset: Binding<CGFloat>,
         @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self._offset = offset
        self.rect = rect
        self.tabs = tabs
    }

    func makeUIView(context: Context) -> UIScrollView {
        setupScrollView()
        // Set content side
        scrollView.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height)
        scrollView.addSubview(extractView())
        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {

    }

    // Set up ScrollView
    func setupScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }

    // Extract SwiftUI view
    func extractView() -> UIView {
        let controller = UIHostingController(rootView: content)
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        return controller.view!
    }

}

struct ScrollableTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
