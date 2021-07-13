//
//  LabelOptions.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct LabelOptions: View {
    @State private var stepperValue = 1
    var body: some View {
        VStack(spacing: 20) {
            Text("Stepper")
                .font(.largeTitle)
            Text("Label Options")
                .font(.title)
                .foregroundColor(.gray)

            Text("You can declare a stepper with just a string value for the label.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)

            Stepper("What is your age?", value: $stepperValue)
                .padding(.horizontal)
            Text("You can omit a label too. Notice how the stepper view still pushes out horizontally.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)

            Stepper("", value: $stepperValue)
                .padding(.horizontal)
            Text("If you hide the label then no space will be reserved for it.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)

            Stepper("What is your age?", value: $stepperValue)
                .padding(.horizontal)
                .labelsHidden()
        }
        .font(.title)
    }
}

// Note: Even though the label/title is not shown, I would still recommend having one
// because it will still be used for accessiblity purposes.

struct LabelOptions_Previews: PreviewProvider {
    static var previews: some View {
        LabelOptions()
    }
}
