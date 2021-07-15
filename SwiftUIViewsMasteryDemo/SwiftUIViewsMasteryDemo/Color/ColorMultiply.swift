//
//  ColorMultiply.swift
//  SwiftUIViewsMasteryDemo
//
//  Created by RecherJ on 2021/7/15.
//

import SwiftUI

struct ColorMultiply: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color")
                .font(.largeTitle)
            Text("Color Multiply")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can combine colors to form new colors with Color Multiply")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.yellow)
                .layoutPriority(1)

            HStack {
                Color.pink
                    .frame(width: 88, height: 88)

                Image(systemName: "plus")
                    .font(.title)

                Color.blue
                    .frame(width: 88, height: 88)

                Image(systemName: "equal")
                    .font(.title)

                Color.pink.colorMultiply(Color.blue)
                    .frame(width: 88, height: 88)
            }
        }
    }
}

struct ColorMultiply_Previews: PreviewProvider {
    static var previews: some View {
        ColorMultiply()
    }
}
