//
//  WeightAndTextStyleCombined.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct WeightAndTextStyleCombined: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Text")
                .font(.largeTitle)
            Text("Weight & Text Style")
                .font(.title)
                .foregroundColor(.gray)
            HStack {
                Image("FontWeight")
                    .resizable()
                    .frame(width: 40, height: 50)
                Image(systemName: "plus")
                Image("Font")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(.leading, -10)
            }

            Text("These Weights can be combined with Text Styles.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.green)
                .foregroundColor(Color.white)

            Text("Ultralight - Title")
                .fontWeight(.ultraLight)
                .font(.title)
            Text("Thin - Body")
                .fontWeight(.thin)
                .font(.body)
            Text("Light - LargeTitle")
                .fontWeight(.light)
                .font(.largeTitle)
            Text("Bold - Callout")
                .fontWeight(.bold)
                .font(.callout)
            Text("Black - Title")
                .fontWeight(.black)
                .font(.title)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct WeightAndTextStyleCombined_Previews: PreviewProvider {
    static var previews: some View {
        WeightAndTextStyleCombined()
    }
}
