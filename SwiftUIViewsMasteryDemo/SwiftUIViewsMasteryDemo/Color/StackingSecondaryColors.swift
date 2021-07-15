//
//  StackingSecondaryColors.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct StackingSecondaryColors: View {
    var body: some View {
        VStack(spacing: 40) {
            ZStack(alignment: .bottom) {
                Color.secondary

                VStack {
                    Text("Color")
                        .font(.largeTitle)
                    ZStack {
                        Color.secondary
                        Text("Layering the Secondary Color")
                            .font(.title)
                            .foregroundColor(.primary)
                            .colorInvert()
                    }
                    .frame(height: 150)
                }
            }
            .frame(height: 150)

            Divider()
            Text("When you stack the Secndary color on top of each other, it gets slightly darker or lighter, depending if in light or dark mode.")
                .frame(maxWidth:. infinity)
                .padding()
                .font(.title)
                .background(Color.red)
                .foregroundColor(.white)

            ZStack {
                Color.secondary
                Color.secondary.padding()
                Color.secondary.padding(40)
                Color.secondary.padding(60)
                Color.secondary.padding(80)
            }
            .frame(height: 200)
            .padding(.top, 50)
        }
    }
}

struct StackingSecondaryColors_Previews: PreviewProvider {
    static var previews: some View {
        StackingSecondaryColors()
    }
}
