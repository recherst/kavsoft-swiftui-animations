//
//  SegmentedControlIntroduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct SegmentedControlIntroduction: View {

    @State private var dayNight = "day"
    @State private var tab = 1

    var body: some View {

        VStack(spacing: 20) {
            Text("Segmented Control (Picker)")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            Text("Associate the segmented control with an @State variable that will control which segment is selected. The state variable will match each segment's tag value.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.red)
                .foregroundColor(Color.white)

            Picker("", selection: $dayNight) {
                Text("Day")
                    .tag("day")
                Text("Night")
                    .tag("night")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Text("With Images:")

            Picker("", selection: $tab) {
                Image(systemName: "sun.min")
                    .tag(0)
                Image(systemName: "moon")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

struct SegmentedControlIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlIntroduction()
    }
}
