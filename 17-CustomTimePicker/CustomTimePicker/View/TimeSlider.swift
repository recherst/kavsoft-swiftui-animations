//
//  TimeSlider.swift
//  CustomTimePicker
//
//  Created by recherst on 2021/8/18.
//

import SwiftUI

struct TimeSlider: View {
    @EnvironmentObject var dateModel: DateViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Time slider
                let width = geometry.frame(in: .global).width / 2
                // Knob or Circle
                Circle()
                    .fill(Color.blue)
                    .frame(width: 40, height: 40)
                    .offset(x: width - 50)
                    .rotationEffect(Angle(degrees: dateModel.angle))
                    // Changing on gesture
                    .gesture(
                        DragGesture()
                            .onChanged(onChanged(value:))
                            .onEnded(onEnd(value:))
                    )
                    .rotationEffect(Angle(degrees: -90))

                ForEach(1...12, id: \.self) { index in
                    VStack {
                        Text("\(index)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            // Revering back the inside view
                            .rotationEffect(Angle(degrees: Double(-index) * 30))
                    }
                    .offset(y: -width + 50)
                    // Rotating view
                    // 12 * 30 = 360 degree
                    .rotationEffect(Angle(degrees: Double(index) * 30))
                }

                // Arrow
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
                    .overlay(
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 2, height: width / 2)

                        , alignment: .bottom
                    )
                    .rotationEffect(Angle(degrees: dateModel.angle))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 300)
    }

    func onChanged(value: DragGesture.Value) {
        // Get angle
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        // Circle or knob size is 40
        // So radians = 20
        let radians = atan2(vector.dy - 20, vector.dx - 20)
        var angle = radians * 180 / .pi
        if angle < 0 { angle += 360 }
        dateModel.angle = Double(angle)

        if !dateModel.changeToMin {
            // Round for minites
            let roundValue = 30 * Int(round(dateModel.angle / 30))

            dateModel.angle = Double(roundValue)
        } else {
            // Update minites
            let progress = dateModel.angle / 360
            dateModel.minites = Int(progress * 60)
        }
    }

    func onEnd(value: DragGesture.Value) {
        if !dateModel.changeToMin {
            // Update picker to minites
            dateModel.hour = Int(dateModel.angle / 30)
            withAnimation {
                // Set to minite value
                dateModel.angle = Double(dateModel.minites * 6)
                dateModel.changeToMin = true
            }
        }
    }
}

struct TimeSlider_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
