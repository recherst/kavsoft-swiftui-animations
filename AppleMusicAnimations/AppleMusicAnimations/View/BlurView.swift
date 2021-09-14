//
//  BlurView.swift
//  AppleMusicAnimations
//
//  Created by recherst on 2021/9/14.
//

import SwiftUI

struct BlurView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}
