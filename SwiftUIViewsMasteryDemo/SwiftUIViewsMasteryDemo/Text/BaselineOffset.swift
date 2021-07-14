//
//  BaselineOffset.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct BaselineOffset: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Baseline Offset")
                .font(.title)
                .foregroundColor(.gray)

            Image("BaselineOffset")
                .resizable()
                .frame(width: 40, height: 40)
            Text("By default, your combined text will be on the same baseline, like this:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)

            Text("100").underline()
                + Text(" SWIFTUI ")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(.blue)
                    .underline()
                + Text("VIEWS").underline()

            Text("But you can offset each text view to create a cooler effect, like this:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)

            Group {
                Text("100").bold()
                    + Text(" SWIFTUI ")
                    .font(Font.system(size: 60))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.blue)
                    // Negative numbers go down
                    .baselineOffset(-12)
                    + Text("VIEWS").bold()
            }
            .layoutPriority(2)
        }
        .font(.title)
    }
}

struct BaselineOffset_Previews: PreviewProvider {
    static var previews: some View {
        BaselineOffset()
    }
}
