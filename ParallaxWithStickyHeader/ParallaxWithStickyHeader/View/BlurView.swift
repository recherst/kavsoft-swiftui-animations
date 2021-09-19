//
//  BlurView.swift
//  ParallaxWithStickyHeader
//
//  Created by recherst on 2021/9/19.
//

import SwiftUI

struct BlurView: UIViewRepresentable {

    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}

