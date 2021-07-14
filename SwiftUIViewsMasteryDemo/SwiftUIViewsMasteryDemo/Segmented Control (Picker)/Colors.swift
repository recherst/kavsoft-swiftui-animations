//
//  Colors.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct Colors: View {
    @State private var selection = 2

    var body: some View {
        VStack(spacing: 20) {
            Text("Segmented Control (Picker)")
                .font(.largeTitle)
            Text("Colors")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can change the color of segmented controls by using the background modifier.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.red)
                .foregroundColor(Color.white)

            Text("When you add a color, notice the corners")

            Picker("", selection: $selection) {
                Text("One").tag(1)
                Text("Two").tag(2)
                Text("Three").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.pink)
            .padding(.horizontal)

            Text("Adding a corner radius should handle it:")
            Picker("", selection: $selection) {
                Text("One").tag(1)
                Text("Two").tag(2)
                Text("Three").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.pink)
            .cornerRadius(8)
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
    }
}
