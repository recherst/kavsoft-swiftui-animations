//
//  Home.swift
//  WheelPicker
//
//  Created by recherst on 2021/10/1.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
