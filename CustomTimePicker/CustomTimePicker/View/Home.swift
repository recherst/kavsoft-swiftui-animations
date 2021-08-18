//
//  Home.swift
//  CustomTimePicker
//
//  Created by recherst on 2021/8/18.
//

import SwiftUI

struct Home: View {
    @StateObject var dateModel = DateViewModel()
    var body: some View {
        ZStack {
            Text(dateModel.selectedDate, style: .time)
                .font(.largeTitle)
                .fontWeight(.bold)
                .onTapGesture {
                    withAnimation(.spring()) {
                        dateModel.showPicker.toggle()
                    }
                }

            // Picker view
            VStack {
                HStack(spacing: 18) {
                    Spacer()

                    HStack(spacing: 0) {
                        Text("\(dateModel.hour):")
                            .font(.largeTitle)
                            .fontWeight(dateModel.changeToMin ? .light : .bold)
                            .onTapGesture {
                                dateModel.changeToMin = false
                            }

                        Text("\(dateModel.minites < 10 ? "0" : "")\(dateModel.minites)")
                            .font(.largeTitle)
                            .fontWeight(dateModel.changeToMin ? .bold : .light)
                            .onTapGesture {
                                dateModel.changeToMin = true
                            }
                    }

                    VStack(spacing: 8) {
                        Text("AM")
                            .font(.title2)
                            .fontWeight(dateModel.symbol == "AM" ? .bold : .light)
                            .onTapGesture {
                                dateModel.symbol = "AM"
                            }

                        Text("PM")
                            .font(.title2)
                            .fontWeight(dateModel.symbol == "PM" ? .bold : .light)
                            .onTapGesture {
                                dateModel.symbol = "PM"
                            }
                    }
                    .frame(width: 50)
                }
                .padding()
                .foregroundColor(.white)

                // Circle slider
                TimeSlider()
                // Max height
                .frame(height: 300)
            }
            // Max width
            .frame(width: width - 120)
            .background(Color.primary)
            .cornerRadius(8)
            .environmentObject(dateModel)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Extending view to get screen size
extension View {
    var width: CGFloat {
        UIScreen.main.bounds.width
    }
}
