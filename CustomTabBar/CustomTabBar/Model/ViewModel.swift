//
//  ViewModel.swift
//  CustomTabBar
//
//  Created by recherst on 2021/9/27.
//

import SwiftUI

class ViewModel: ObservableObject {

    @Published var isOrderLoad = false
    @Published var isRestaurantLoad = false
    @Published var isRewardLoad = false

    init() {
        print("Home Data Loaded")
    }

    func loadOrders() {
        print("Order Loaded")
        isOrderLoad = true
    }

    func loadRestaurant() {
        print("Restaurant Loaded")
        isRestaurantLoad = true
    }

    func loadReward() {
        print("Reward Loaded")
        isRewardLoad = true
    }
}
