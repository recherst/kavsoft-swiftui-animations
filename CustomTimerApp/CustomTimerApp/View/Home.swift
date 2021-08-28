//
//  Home.swift
//  CustomTimerApp
//
//  Created by recherst on 2021/8/28.
//

import SwiftUI

struct Home: View {
    @StateObject var data = TimerData()
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false, content: {
                    // Time buttons
                    HStack(spacing: 20) {
                        ForEach(1...6, id: \.self) { index in
                            // Each time will be multiple of 5
                            let time = index * 5

                            Text("\(time)")
                                .font(.system(size: 45, weight: .heavy))
                                .frame(width: 100, height: 100)
                                // Change color for selected one
                                .background(data.time == time ? Color("pink") : Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation {
                                        data.time = time
                                        data.selectedTime = time
                                    }
                                }

                        }
                    }
                    .padding()
                })
                // Set to center
                .offset(y: 40)
                Spacer()

                // Start button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.65)) {
                        data.buttonAnimation.toggle()
                    }

                    // Delay animation
                    // After button goes down view is moving up
                    withAnimation(.easeIn.delay(0.6)) {
                        data.timerViewOffset = 0
                    }
                }, label: {
                    Circle()
                        .fill(Color("pink"))
                        .frame(width: 80, height: 80)
                })
                .padding(.bottom, 35)
                .disabled(data.time == 0)
                .opacity(data.time == 0 ? 0.6 : 1)
                // Move down smoothly
                .offset(y: data.buttonAnimation ? 300 : 0)
            }

            Color("pink")
                .ignoresSafeArea(.all, edges: .all)
                .overlay(
                    Text("\(data.selectedTime)")
                        .font(.system(size: 55, weight: .heavy))
                        .foregroundColor(.white)
                )
                .offset(y: data.timerViewOffset)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("bg")
                .ignoresSafeArea(.all, edges: .all)
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
