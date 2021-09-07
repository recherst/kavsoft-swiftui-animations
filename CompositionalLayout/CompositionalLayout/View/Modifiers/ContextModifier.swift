//
//  ContextModifier.swift
//  CompositionalLayout
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

struct ContextModifier: ViewModifier {
    // ContextMenu Modifier
    var card: Card

    func body(content: Content) -> some View {
        content
            .contextMenu(menuItems: {
                Text("By \(card.author)")
            })
            .contentShape(RoundedRectangle(cornerRadius: 5))
    }
}
