//
//  LineLimit.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct LineLimit: View {
    var body: some View {

        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Wrapping")
                .font(.title)
                .foregroundColor(.gray)

            Image("LineLimit")

            Text("The Text view shows read-only text that can be modified in many ways. It wraps automatically. If you want to limit the text wrapping, add  .lineLimit(<number of lines here>).")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.green)
                .foregroundColor(.white)

            Text("Here, I am limiting the text to just one line.")
                .lineLimit(1)
                .font(.title)
                .padding(.horizontal)
        }
    }
}

struct LineLimit_Previews: PreviewProvider {
    static var previews: some View {
        LineLimit()
    }
}
