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

    @Published var swipedCard = 0

    // Detail content
    @Published var showCard = false
    @Published var selectedCard = Card(cardColor: .clear, title: "")

    @Published var showContent = false

    var content = "Apple's MacBook Pro 14-inch 2021 could bring with is a proper redesign, as well as a new display form-factor, shaking up the somewhat long in the tooth design of the current MacBook Pros. We're expecting to see a new design built around slimmer display bezels, more ports and either the Apple M2 chip or M1X slice of Apple Silicon, and potentially the return of the return MagSafe and the end of the Touch Bar. The 20-core model would have up to 16 high-performance cores, though Apple is reportedly testing versions with only 8 or 12 high-performance cores enabled. The decision to disable cores would depend on any issues discovered during production. The 2021 MacBook Pro also appears to be the end of Intel inside the MacBook Pro. While that could have been guessed, as Macs are currently transitioning to Apple Silicon, we can quote Kuo's recent report, where he noted \"There is no Intel CPU option for the new models.\""
}
