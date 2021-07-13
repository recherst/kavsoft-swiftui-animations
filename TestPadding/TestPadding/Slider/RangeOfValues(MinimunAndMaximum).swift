//
//  RangeOfValues(MinimunAndMaximum).swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct RangeOfValues_MinimunAndMaximum_: View {
    @State private var age = 18.0

    let ageFormmatter: NumberFormatter = {
        let numFormatter = NumberFormatter()
        // Format the slider value into a spelled-out number.
        numFormatter.numberStyle = .spellOut
        return numFormatter
    }()

    var body: some View {
        VStack(spacing: 40) {
            Text("Slider")
                .font(.largeTitle)
            Text("Range of values")
                .foregroundColor(.gray)
            Text("You can also set your own min and max values.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.black)

            Text("What is your age?")

            // Provide a range here.
            // The step parameter defines the increment from one value to the next.
            Slider(value: $age, in: 1...100, step: 1)
                .padding(.horizontal)

            Text("Age is: ") + Text("\(ageFormmatter.string(from: NSNumber(value: age))!)")
        }
        .font(.title)
    }
}

struct RangeOfValues_MinimunAndMaximum__Previews: PreviewProvider {
    static var previews: some View {
        RangeOfValues_MinimunAndMaximum_()
    }
}
