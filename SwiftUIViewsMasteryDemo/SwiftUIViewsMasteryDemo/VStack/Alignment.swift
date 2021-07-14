//
//  Alignment.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/5.
//

import SwiftUI

struct Alignment: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("VStack")
                .font(.largeTitle)
            Text("Alignment")
                .font(.title)
                .foregroundColor(.gray)
            Text("By Default, views in a VStack are center aligned.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .foregroundColor(.white)
                .background(Color.blue)
            VStack(alignment: .leading, spacing: 40) {
                Text("Leading Alignment")
                    .font(.title)
                Divider() // Create a thin line (Push-out view)
                Image(systemName: "arrow.left")
            }
            .padding()
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.blue)
            .padding()

            VStack(alignment: .trailing, spacing: 40) {
                Text("Trailing Alignment")
                    .font(.title)
                Divider()
                Image(systemName: "arrow.right")
            }
            .padding()
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.blue)
            .padding()
        }
    }
}

struct Alignment_Previews: PreviewProvider {
    static var previews: some View {
        Alignment()
    }
}
