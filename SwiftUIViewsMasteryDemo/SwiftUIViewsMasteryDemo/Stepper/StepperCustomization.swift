//
//  StepperCustomization.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct StepperCustomization: View {
    @State private var contrast = 50

    var body: some View {
        VStack(spacing: 20) {
            Text("Stepper")
                .font(.largeTitle)
            Text("Customization")
                .font(.title)
                .foregroundColor(.gray)
            Text("A foreground and background color can be set.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)

            Stepper(
                onIncrement: {},
                onDecrement: {},
                label: {
                    Text("Custom Stepper")
                        .font(.title)
                        .padding(.vertical)
                })
                .padding(.horizontal)
                .background(Color.blue)
                .foregroundColor(.white)

            Text("Notice the minus and plus buttons are not affected. The platforms determine how this will be shown.")

            Text("You can add images too.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .font(.title)
                .layoutPriority(1)

            Stepper(value: $contrast, in: 0...100) {
                // SwiftUI implicitly uses an HStack here
                Image(systemName: "circle.lefthalf.fill")
                Text("\(contrast)/100")
            }
            .font(.title)
            .padding(.horizontal)
            .foregroundColor(.blue)

        }
        .font(.title)
    }
}

struct StepperCustomization_Previews: PreviewProvider {
    static var previews: some View {
        StepperCustomization()
    }
}
