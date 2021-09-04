//
//  DropViewDelegate.swift
//  DragAndDropAPI
//
//  Created by recherst on 2021/9/4.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    var page: Page
    var pageData: PageViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    // When user dragged into new page
    func dropEntered(info: DropInfo) {
        // get from and to index
        // From index
        let fromIndex = pageData.urls.firstIndex { $0.id == pageData.currentPage?.id } ?? 0
        // To index
        let toIndex = pageData.urls.firstIndex { $0.id == page.id } ?? 0

        if fromIndex != toIndex {
            withAnimation(.default) {
                // Swap data
                let fromPage = pageData.urls[fromIndex]
                pageData.urls[fromIndex] = pageData.urls[toIndex]
                pageData.urls[toIndex] = fromPage
            }
        }
    }

    // Set action as move
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}
