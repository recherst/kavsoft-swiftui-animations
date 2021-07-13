//
//  StepperColors.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct StepperColors: View {
    @State private var contrast = 50

    var body: some View {
        VStack(spacing: 20) {
            Text("Stepper")
                .font(.largeTitle)
            Text("Colors")
                .foregroundColor(.gray)
            Text("There is on built-in way to change the color of the stepper that I have found. Instead, I had to hide the label and apply a color behind it.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.blue)
                .foregroundColor(.white)

            Stepper(value: $contrast, in: 0...100) {
                Text("Applying Accent Color (no effect)")
            }
            .accentColor(.blue)

            HStack {
                Text("My Custom Colored Stepper")
                Spacer()
                Stepper("", value: $contrast)
                    .background(Color(UIColor.systemTeal))
                    .cornerRadius(9)
                    .labelsHidden() // hide the label
            }

            HStack {
                Text("My Custom Colored Stepper")
                Spacer()
                Stepper("", value: $contrast)
                    .background(Color.orange)
                    .cornerRadius(9)
                    .labelsHidden() // hide the label
            }

        }
    }
}

struct StepperColors_Previews: PreviewProvider {
    static var previews: some View {
        StepperColors()
    }
}
