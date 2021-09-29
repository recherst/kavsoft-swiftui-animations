//
//  Home.swift
//  AppLock
//
//  Created by recherst on 2021/9/29.
//

import SwiftUI

struct Home: View {
    @State var unLocked = false
    var body: some View {
        ZStack {
            // Lock screen
            if unLocked {
                Text("App Unlocked")
                    .font(.title2)
                    .fontWeight(.heavy)
            } else {
                LockScreen(unLocked: $unLocked)
            }
        }
        .preferredColorScheme(unLocked ? .light : .dark)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
