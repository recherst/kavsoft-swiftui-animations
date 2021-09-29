//
//  PasswordView.swift
//  AppLock
//
//  Created by recherst on 2021/9/29.
//

import SwiftUI

struct PasswordView: View {
    var index: Int
    @Binding var password: String
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 2)
                .frame(width: 30, height: 30)

            // Check whether it is typed
            if password.count > index {
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)
            }
        }
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
