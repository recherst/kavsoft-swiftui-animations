//
//  ContentView.swift
//  HeroCarouselSlider
//
//  Created by recherst on 2021/9/8.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeModel = CarouselViewModel()
    var body: some View {
        Home()
            .environmentObject(homeModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
