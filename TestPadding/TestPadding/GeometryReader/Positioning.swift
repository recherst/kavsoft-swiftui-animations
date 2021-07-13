//
//  Positioning.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/9.
//

import SwiftUI

struct Positioning: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("GeometryReader")
                .font(.largeTitle)
            Text("Positioning")
                .font(.title)
                .foregroundColor(.gray)
            Text("Use the geometry reader's variable to help position child views at different location within the geometry's view instead of it being in the center.")
                .font(.title)
                .padding()

            // Define a parameter to reference the geometry's coordinate space.
            GeometryReader { geometry in
                Text("Upper Left")
                    .font(.title)
                    .position(
                        x: geometry.size.width / 5,
                        y: geometry.size.height / 10
                    )
                Text("Lower Right")
                    .font(.title)
                    .position(
                        x: geometry.size.width - 90,
                        y: geometry.size.height - 40
                    )
            }
            .background(Color.pink)
            .foregroundColor(.white)

            Text("Note: the position modifier uses the view's center point when setting the X and Y parameters.")
                .font(.title)
        }
    }
}

struct Positioning_Previews: PreviewProvider {
    static var previews: some View {
        Positioning()
    }
}
