//
//  BlurView.swift
//  VPNAppUI
//
//  Created by recherst on 2021/9/16.
//

import SwiftUI

struct BlurView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialLight))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}

