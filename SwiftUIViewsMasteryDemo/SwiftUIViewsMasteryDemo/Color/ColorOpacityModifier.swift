//
//  ColorOpacityModifier.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct ColorOpacityModifier: View {
    var body: some View {
        ZStack {
            Color.purple
            VStack(spacing: 20) {
                Text("Color")
                    .font(.largeTitle)
                Text("Opacity Modifier")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("You can also use the opacity modifier. (Note: The opacity can apply to any view, not just Color views.)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black.opacity(0.25))
                    .font(.title)
                    .layoutPriority(1)

                Text("The opacity modifier can also be applied to a custom color.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme1Background").opacity(0.6))
                    .font(.title)
                    .layoutPriority(1)
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct ColorOpacityModifier_Previews: PreviewProvider {
    static var previews: some View {
        ColorOpacityModifier()
    }
}
