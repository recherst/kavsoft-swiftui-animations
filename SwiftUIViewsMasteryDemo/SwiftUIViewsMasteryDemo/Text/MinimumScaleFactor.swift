//
//  MinimumScaleFactor.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct MinimumScaleFactor: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Minimum Scale Factor")
                .font(.title)
                .foregroundColor(.gray)

            Text(".allowTightening(true) is being used here:")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.green)
                .foregroundColor(Color.white)
            Text("Sometimes you want to shrink text if long")
                .allowsTightening(true)
                .font(.title)
                .lineLimit(1)

            Text("Allows tightening is failing here because the text is too long. In this case, you can apply a minimum scale factor and specify by how much you want to allow the text  to shrink.")
                .padding(.horizontal)
            Text(".minimumScaleFactor(0.5) is being used here:")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.green)
                .foregroundColor(Color.white)
            Text("Sometimes you want to shrink text if long")
                .font(.title)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(".minimumScaleFactor takes a fraction from 0 to 1. For example, 0.3 is 30% of the original size of the font that it can shrink. If the font size is 100, then it can shrink to 30.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)

        }
    }
}

struct MinimumScaleFactor_Previews: PreviewProvider {
    static var previews: some View {
        MinimumScaleFactor()
    }
}
