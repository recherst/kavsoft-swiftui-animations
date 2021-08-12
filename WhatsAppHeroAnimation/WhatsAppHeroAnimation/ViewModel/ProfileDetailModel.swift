//
//  ProfileDetailModel.swift
//  WhatsAppHeroAnimation
//
//  Created by recherst on 2021/8/12.
//

import Foundation
import Combine

class ProfileDetailModel: ObservableObject {
    @Published var showProfile = false

    // Storing the selected profile
    @Published var selectedProfile: Profile!

    // To show big image
    @Published var showEnlargedImage = false
}
