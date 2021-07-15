//
//  ColorIntroduction.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct ColorIntroduction: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Color")
                .font(.largeTitle)
            Text("Colors are Views")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can treat colors as views with their own frames and modifiers.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .layoutPriority(1)

            HStack(spacing: 40) {
                Color.pink
                    .frame(width: 88, height: 88)
                Color.blue
                    .frame(width: 88, height: 88)
                Color.purple
                    .frame(width: 88, height: 88)
                    .cornerRadius(20)
            }
            Spacer()
        }
        .font(.title)
    }
}

struct ColorIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        ColorIntroduction()
            .preferredColorScheme(.dark)
    }
}
