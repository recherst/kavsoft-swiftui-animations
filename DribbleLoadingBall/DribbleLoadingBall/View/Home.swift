//
//  Home.swift
//  DribbleLoadingBall
//
//  Created by recherst on 2021/8/16.
//

import SwiftUI

struct Home: View {
    @State var rotateBall = false
    @State var showPopup = false
    // Color scheme for dark mode adoption
    @Environment(\.colorScheme) var scheme

    var body: some View {
        VStack {
            Toggle(isOn: $rotateBall, label: {
                Text("Rotate Ball")
            })
            .padding()
            .padding(.vertical)

            // Custom shadow button
            Button(action: {}, label: {
                Text("Show Popup")
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(scheme == .dark ? Color.black : Color.white)
                    .cornerRadius(8)
                    // Shadow
                    .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.primary.opacity(0.1), radius: 5, x: -5, y: -5)
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
