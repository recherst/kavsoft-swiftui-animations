//
//  ScrollableTabBar.swift
//  InstagramViewLayout
//
//  Created by Maxim Macari on 8/2/21.
//

import SwiftUI

struct ScrollableTabBar<Content: View>: UIViewRepresentable {
    
    
    // To store our Swiftui view
    var content: Content
    
    // Getting rect to calculate width and height of scrollView
    var rect: CGRect
    
    // Contentoffset
    @Binding var offset: CGFloat
    
    var tabs: [Any]
    
    // Scrollview
    // for paging aka scrollablee tabs
    let scrollview = UIScrollView()
    
    init(tabs: [Any], rect: CGRect, offset: Binding<CGFloat>, @ViewBuilder content: ()-> Content) {
        self.content = content()
        self._offset = offset
        self.rect = rect
        self.tabs = tabs
    }
    
    func makeCoordinator() -> Coordinator {
        return ScrollableTabBar.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        self.setUpScrollView()
        
        scrollview.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        scrollview.contentOffset.x = offset
        
        scrollview.addSubview(extraView())
        
        scrollview.delegate = context.coordinator
        
        return scrollview
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        // updating view
        if uiView.contentOffset.x != offset {
            // Animation
            // The naimation glitch is because is's updating on two times
            // Removee delegate whilee animating
            
            uiView.delegate = nil
            
            UIView.animate(withDuration: 0.4) {
                uiView.contentOffset.x = offset
            } completion: { (status) in
                if status{
                    uiView.delegate = context.coordinator
                }
            }
        }
    }
    
    // Setting up ScrollView
    private func setUpScrollView(){
        scrollview.isPagingEnabled = true
        scrollview.bounces = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
    }
    
    private func extraView() -> UIView {
        // Since it depends upon tab size, also we're getting tabs
        
        // For ease of use
        let controller = UIHostingController(rootView: HStack(spacing: 0) { content }.ignoresSafeArea())
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        return controller.view!
    }
    
    // Delegate function to get offset
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: ScrollableTabBar
        
        init(parent: ScrollableTabBar) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
        }
    }
}

