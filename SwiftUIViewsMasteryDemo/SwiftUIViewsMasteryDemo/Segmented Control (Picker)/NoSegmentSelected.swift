//
//  NoSegmentSelected.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct NoSegmentSelected: View {
    @State private var selection = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("Segmented Control (Picker)")
                .font(.largeTitle)
            Text("No Segment Selected")
                .font(.title)
                .foregroundColor(.gray)
            Text("This segmented control will have nothing selected because the default state variable does not match any of the segment tag values.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.red)
                .foregroundColor(Color.white)

            Text("How many meals do you eat?")
                .foregroundColor(.gray)
                .font(.title)

            Picker("", selection: $selection) {
                Text("One")
                    .tag(1)
                Text("Two")
                    .tag(2)
                Text("Three")
                    .tag(3)
                Text("More")
                    .tag(4)
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.red, lineWidth: selection == 0 ? 1 : 0)
            )
            .padding()

            Text("The red outline will go away once a selection is made.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.red)
                .foregroundColor(Color.white)
        }
    }
}

struct NoSegmentSelected_Previews: PreviewProvider {
    static var previews: some View {
        NoSegmentSelected()
    }
}
