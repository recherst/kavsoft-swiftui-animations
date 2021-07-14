//
//  BackgroundImages.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct BackgroundImages: View {
    var body: some View {
        Form {
            Section(
                header: Text("Form")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
            ) {
                Text("List Row background")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("Images work a little differently as you can see here.")
                Text("The image is actually set on a row on the second section.")
            }

            Section(
                header: Text("Images")
                            .font(.title)
                            .foregroundColor(.white)
            ) {
                Text("An image is set as a background for the row below. This works fine for rows, but when you use an image on the section level, it is repeated for all rows.")
                Text("The image is set on THIS row, but it extends past the bounds. It also hides the row below this one and goes under the previous rows.")
                    .foregroundColor(.white)
                    .listRowBackground(
                        Image("water")
                            .clipped()
                            .blur(radius: 3)
                    )
                Text("This row cannot be seen.")
            }
        }
    }
}

struct BackgroundImages_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImages()
    }
}
