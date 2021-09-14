//
//  MiniPlayer.swift
//  AppleMusicAnimations
//
//  Created by recherst on 2021/9/14.
//

import SwiftUI

struct MiniPlayer: View {
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .cornerRadius(15)
                Text("Lady Gaga")
                    .font(.title2)
                    .fontWeight(.bold)

                Spacer(minLength: 0)

                Button(action: {}, label: {
                    Image(systemName: "play.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })

                Button(action: {}, label: {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
            }
            .padding(.horizontal)
        }
        .frame(height: 80)
        // Move the mini-player above the tabbar
        // approz tab bar height is 49

        // Divider line for separating miniplayer and tab bar
        .background(
            VStack(spacing: 0) {
                BlurView()

                Divider()
            }
        )
        .offset(y: -48)
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
