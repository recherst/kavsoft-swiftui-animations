//
//  SliderIntroduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

// When using a Slider view, the default range of values is 0.0 to 1.0. You bind the
// Slider to a state variable, usually a number type, like an Int. But it doesn't
// have to be a number type. It can be any type that conforms to the Stridable protocol.
// ("Stride" means to "take steps in a direction; usually long steps".) A type that
// conforms to Stridable (such as an Int) means it has values that are continuous and
// can be stepped through and measured. ("Step throught", "Stride", I think you see the
// connection now.)

// You use the bound variable to set or get the value the Slider's thumb (circle) is
// currently at.

// This is a pull-in view.

struct SliderIntroduction: View {
    // Value used for the slider.
    @State private var sliderValue = 0.5

    var body: some View {
        VStack(spacing: 40) {
            Text("Slider")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)
            Text("Assiciate the Slider with an @State variable that will controls where the thumb (circle) will be on the slider's track.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.black)

            Text("Default min value is 0.0 and max value is 1.0")

            Slider(value: $sliderValue)
                .padding(.horizontal)

            // Set the state variable in the slider's initializer.
            Text("Value is: ") + Text("\(sliderValue)").foregroundColor(.orange)

        }
        .font(.title)
    }
}

struct SliderIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        SliderIntroduction()
    }
}
