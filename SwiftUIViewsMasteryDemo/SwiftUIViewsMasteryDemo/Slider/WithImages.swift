//
//  WithImages.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct WithImages: View {
    @State private var sliderValue = 0.5
    var body: some View {
        VStack(spacing: 20) {
            Text("Slider")
                .font(.largeTitle)
            Text("With Images")
                .foregroundColor(.gray)

            Text("Combine the slider with images in an HStack, VStack or both!")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.black)

            HStack {
                Image(systemName: "tortoise")
                Slider(value: $sliderValue)
                Image(systemName: "hare")
            }
            .foregroundColor(.green)
            .padding()

            HStack {
                Image(systemName: "speaker.fill")
                Slider(value: $sliderValue)
                Image(systemName: "speaker.3.fill")
            }
            .foregroundColor(.accentColor)
            .padding()

            VStack {
                Slider(value: $sliderValue)
                    .accentColor(.orange)
                HStack {
                    Image(systemName: "circle")
                    Spacer()
                    Image(systemName: "circle.righthalf.fill")
                    Spacer()
                    Image(systemName: "circle.fill")
                }
                .foregroundColor(.orange)
                .padding(.top, 8)
            }
            .padding()
        }
        .font(.title)
    }
}

struct WithImages_Previews: PreviewProvider {
    static var previews: some View {
        WithImages()
            .preferredColorScheme(.dark)
    }
}
