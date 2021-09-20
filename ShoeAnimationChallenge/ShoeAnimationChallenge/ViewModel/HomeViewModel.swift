//
//  HomeViewModel.swift
//  ShoeAnimationChallenge
//
//  Created by recherst on 2021/8/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var showCart = false
    @Published var selectedSize = ""

    // Animation properties
    @Published var startAnimation = false
    @Published var shoeAnimation = false

    @Published var showBag = false
    @Published var saveCart = false

    @Published var addItemToCart = false

    @Published var endAnimation = false

    @Published var cartItems = 0

    // Perform animation
    func performAnimations() {
        withAnimation(.easeOut(duration: 0.8)) {
            shoeAnimation.toggle()
        }

        // Chain animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            withAnimation(.easeInOut) {
                self.showBag.toggle()
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.saveCart.toggle()
            }
        }

        // 0.75 + 0.5 = 1.25
        // Because to start animation before the shoe comes to cart
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            self.addItemToCart.toggle()
        }

        // End animation will start at 1.25
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.endAnimation.toggle()
            }
        }
    }

    func resetAll() {
        // Give some time fo finish animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
            withAnimation {
                showCart.toggle()
            }

            startAnimation = false
            endAnimation = false
            selectedSize = ""
            addItemToCart = false
            showBag = false
            saveCart = false
            cartItems += 1
        }
    }
    
}
