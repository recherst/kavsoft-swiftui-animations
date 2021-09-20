//
//  PageViewModel.swift
//  DragAndDropAPI
//
//  Created by recherst on 2021/9/4.
//

import SwiftUI

class PageViewModel: ObservableObject {
    // SelectedTab
    @Published var selectedTab = "tabs"
    
    @Published var urls = [
        Page(url: URL(string: "https://www.google.com")!),
        Page(url: URL(string: "https://www.apple.com")!),
        Page(url: URL(string: "https://www.baidu.com")!),
        Page(url: URL(string: "https://www.sina.com.cn")!),
        Page(url: URL(string: "https://www.alibaba.com")!),
        Page(url: URL(string: "https://www.163.com")!),
        Page(url: URL(string: "https://www.twitter.com")!),
        Page(url: URL(string: "https://www.facebook.com")!),
        Page(url: URL(string: "https://www.qq.com")!),
        Page(url: URL(string: "https://www.ebay.com")!),
        Page(url: URL(string: "https://www.microsoft.com")!),
        Page(url: URL(string: "https://www.bing.com")!),
    ]

    // Currently dragging page
    @Published var currentPage: Page?
}
