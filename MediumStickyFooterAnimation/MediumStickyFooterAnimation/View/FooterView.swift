//
//  FooterView.swift
//  MediumStickyFooterAnimation
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "hands.clap.fill")
                    .font(.title2)
                    .foregroundColor(.primary)
            })
            .frame(maxWidth: .infinity)

            Button(action: {}, label: {
                Image(systemName: "square.and.arrow.up")
                    .font(.title2)
                    .foregroundColor(.primary)
            })
            .frame(maxWidth: .infinity)

            Button(action: {}, label: {
                Image(systemName: "bookmark")
                    .font(.title2)
                    .foregroundColor(.primary)
            })
            .frame(maxWidth: .infinity)

            Button(action: {}, label: {
                Image(systemName: "moon")
                    .font(.title2)
                    .foregroundColor(.primary)
            })
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 15)
        .padding(.top)
        // Maxheight
        .frame(maxHeight: 80)
        .background(Color.white)

    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
