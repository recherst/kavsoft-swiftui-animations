//
//  ZStack_Background_Solution.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/6.
//

import SwiftUI

struct ZStack_Background_Solution: View {
    var body: some View {
        ZStack {
            Color.gray
                // Have JUST the color ignore the safe areas, not the VStack.
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)

                Text("Color Ignores Safe Area Edges")
                    .foregroundColor(.white)

                Text("To solve the problem, you want just the color (bottom layer) to ignore the safe area edges and fill the screen. Other layers above it will respect the safe areas.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                Spacer()
            }
            .font(.title)
        }
    }
}

struct ZStack_Background_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_Background_Solution()
    }
}
