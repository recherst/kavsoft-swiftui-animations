//
//  ToggleIntroduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct ToggleIntroduction: View {
    @State private var isToggleOn = true

    var body: some View {
        VStack(spacing: 20) {
            Text("Toggle")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)
            Text("The Toggle is a 'push-out view' that only pushes out to fill the width of its parent view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)

            Toggle("Night Mode", isOn: $isToggleOn)
                .padding()

            Text("Combine images with text")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)

            Toggle(isOn: $isToggleOn) {
                Text("Night Mode")
                Image(systemName: "moon")
            }
            .padding()

            Text("Or you can have nothing")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)

            VStack {
                Text("Turn Alarm On?")
                    .foregroundColor(.white)
                Toggle("Turn this alarm on", isOn: $isToggleOn)
                    // hide the label/title
                    .labelsHidden()
            }
            .padding(25)
            .background(Color.blue)
            .cornerRadius(20)
        }
        .font(.title)
    }
}

// There is not a lot you can do to change the colors of the thumb(round white circle),
// the on and off positions. You can create your own custom Toggle.
// See the chapter on Custom Styling, in the section ToggleStyle.

struct ToggleIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        ToggleIntroduction()
            .preferredColorScheme(.dark)
    }
}
