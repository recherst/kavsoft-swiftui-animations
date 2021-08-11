//
//  ProfileDetailView.swift
//  WhatsAppHeroAnimation
//
//  Created by recherst on 2021/8/12.
//

import SwiftUI

struct ProfileDetailView: View {
    var  animation: Namespace.ID
    @EnvironmentObject var profileData: ProfileDetailModel
    var body: some View {
        Image(profileData.selectedProfile.profile)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
