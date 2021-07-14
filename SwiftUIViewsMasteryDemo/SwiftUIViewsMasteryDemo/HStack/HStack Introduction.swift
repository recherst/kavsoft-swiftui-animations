//
//  HStack Introduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/5.
//

import SwiftUI

struct HStack_Introduction: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("HStack")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            Text("HStack are views that contain other views laid out horizontally.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)

            HStack {
                Text("Leading")
                Text("Middle")
                Text("Trailing")
            }
            .padding()
            .border(Color.orange) // Create a 2 point border using the color specified

            HStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .padding()

            HStack(spacing: 20) {
                Image(systemName: "a.circle.fill")
                Image(systemName: "b.circle.fill")
                Image(systemName: "c.circle.fill")
                Image(systemName: "d.circle.fill")
                Image(systemName: "e.circle.fill")
            }
            .font(.largeTitle)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.orange)
            )
        }
    }
}

struct HStack_Introduction_Previews: PreviewProvider {
    static var previews: some View {
        HStack_Introduction()
    }
}
