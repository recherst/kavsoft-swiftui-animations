//
//  ContentView.swift
//  WhatsAppHeroAnimation
//
//  Created by recherst on 2021/8/12.
//

import SwiftUI

struct ContentView: View {
    // Animation Namespace
    @Namespace var animation
    // StateObject
    @StateObject var profileData = ProfileDetailModel()

    var body: some View {
        Home(animation: animation)
            .environmentObject(profileData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
