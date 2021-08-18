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
                    .offset(x: -width + 50)

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
                            .frame(width: 2, height: -width / 2)

                        , alignment: .bottom
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct TimeSlider_Previews: PreviewProvider {
    static var previews: some View {
        TimeSlider()
    }
}
