//
//  Customization.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct Customization: View {
    @State private var sliderValue = 0.5

    var body: some View {
        VStack(spacing: 20) {
            Text("Slider")
                .font(.largeTitle)
            Text("Customization")
                .foregroundColor(.gray)
            Text("At the time of this writing, there isn't a way to color the thumb. But we can change the background color and apply some other modifiers.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            Slider(value: $sliderValue)
                .padding(.horizontal, 10)
                .background(Color.orange)
                .clipShape(Capsule())
                .shadow(color: .gray, radius: 2)
                .padding(.horizontal)

            Text("Use the accentColor modifier to change the color of the track.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)

            Slider(value: $sliderValue)
                .padding(10)
                .background(
                    Capsule()
                        .stroke(Color.orange, lineWidth: 2)
                )
                .padding(.horizontal)

            Slider(value: $sliderValue)
                .padding(10)
                .background(
                    Capsule()
                        .fill(Color.orange)
                )
                .accentColor(.black)
                .padding(.horizontal)
        }
        .font(.title)
    }
}

struct Customization_Previews: PreviewProvider {
    static var previews: some View {
        Customization()
    }
}
