//
//  Landscape.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/5.
//

import SwiftUI

struct Landscape: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews")
            Text("landscape")
                .foregroundColor(.gray)
                .font(.title)
            Text("You currently cannot rotate p previewed device. But one option is to set a fixed width and height for your preview.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .foregroundColor(.white)
                .background(Color.red)
        }
        .font(.largeTitle)
    }
}

struct Landscape_Previews: PreviewProvider {
    static var previews: some View {
        Landscape()
            .previewLayout(PreviewLayout.fixed(width: 896, height: 414))
    }
}
