//
//  Getting Size.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/9.
//

import SwiftUI

struct Getting_Size: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("GeometryReader")
                .font(.largeTitle)
            Text("Getting Size")
                .foregroundColor(.gray)

            Text("Use the geometry reader when you need to get the height and/or width of a space.")
                .padding()

            GeometryReader { geometry in
                VStack(spacing: 10) {
                    Text("Width: \(geometry.size.width)")
                    Text("Height: \(geometry.size.height)")
                }
                .foregroundColor(.white)
            }
            .background(Color.pink)

            GeometryReader { geometry in
                VStack(spacing: 10) {
                    Text("Width: \(geometry.size.width)")
                    Text("Height: \(geometry.size.height)")
                }
                .foregroundColor(.white)
            }
            .background(Color.pink)
            .padding()
        }
        .font(.title)
    }
}

struct Getting_Size_Previews: PreviewProvider {
    static var previews: some View {
        Getting_Size()
    }
}
