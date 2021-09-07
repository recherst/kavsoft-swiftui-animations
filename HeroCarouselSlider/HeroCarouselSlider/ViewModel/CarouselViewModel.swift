//
//  CarouselViewModel.swift
//  HeroCarouselSlider
//
//  Created by recherst on 2021/9/8.
//

import SwiftUI

class CarouselViewModel: ObservableObject {

    @Published var cards = [
        Card(cardColor: Color("blue"), title: "Neurobics for your mind."),
        Card(cardColor: Color("purple"), title: "Brush up on hygine."),
        Card(cardColor: Color("green"), title: "Don't skip breakfast."),
        Card(cardColor: Color.yellow, title: "Brush up on hygine."),
        Card(cardColor: Color.orange, title: "Neurobics for your mind."),
    ]
}
