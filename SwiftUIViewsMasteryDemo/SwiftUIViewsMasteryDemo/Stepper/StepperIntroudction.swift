//
//  StepperIntroudction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct StepperIntroudction: View {
    @State private var stepperValue = 1
    @State private var values = [0, 1]
    var body: some View {
        VStack(spacing: 20) {
            Text("Stepper")
                .font(.largeTitle)
            Text("Introudction")
                .font(.title)
                .foregroundColor(.gray)
            Text("The Stepper can be bound to a variable like this:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)

            Stepper(value: $stepperValue) {
                Text("Bound Stepper: \(stepperValue)")
            }
            .padding(.horizontal)
            Divider()
            Image(systemName: "bolt.fill")
                .font(.title)
                .foregroundColor(.yellow)
            Text("Or you can run code on the increment and decrement events:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .font(.title)

            Stepper(
                onIncrement: {
                    values.append(values.count)
                },
                onDecrement: {
                    values.removeLast()
                },
                label: {
                    Text("onIncrement and onDecrement")
                })
                .padding(.horizontal)
            HStack {
                ForEach(values, id: \.self) { value in
                    Image(systemName: "\(value).circle.fill")
                }
            }
            .font(.title)
            .foregroundColor(.green)

        }
        .font(.title)
    }
}

struct StepperIntroudction_Previews: PreviewProvider {
    static var previews: some View {
        StepperIntroudction()
    }
}
