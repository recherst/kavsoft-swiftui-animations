//
//  TextWeights.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct TextWeights: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Font Weights")
                .font(.title)
                .foregroundColor(.gray)
            Image("FontWeight")
            Text("You can apply a verity of font weights to the Text view.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .font(.title)
                .layoutPriority(1)

            Group { // Too many views (> 10) in one container
                Text("Ultralight")
                    .fontWeight(.ultraLight)
                Text("Thin")
                    .fontWeight(.thin)
                Text("Light")
                    .fontWeight(.light)
                Text("Regular")
                    .fontWeight(.regular)
                Text("Medium")
                    .fontWeight(.medium)
                Text("Semibold")
                    .fontWeight(.semibold)
                Text("Bold")
                    .fontWeight(.bold)
                Text("Heavy")
                    .fontWeight(.heavy)
                Text("Black")
                    .fontWeight(.black)
            }
            .font(.title)
        }
    }
}

struct TextWeights_Previews: PreviewProvider {
    static var previews: some View {
        TextWeights()
    }
}
