//
//  Home.swift
//  AnimatedLoadingScreen
//
//  Created by recherst on 2021/8/17.
//

import SwiftUI

struct Home: View {
    // Animation properties
    @State var offsets: [CGSize] = Array(repeating: .zero, count: 3)

    // Static offsets for one full complete rotation

    // So after one complete rotation it will again fire animation
    // for that we're going to use Timer
    @State var timer = Timer.publish(every: 4, on: .current, in: .common).autoconnect()
    @State var delayTime: Double = 0

    var locations: [CGSize] = [
        // rotation 1
        CGSize(width: 110, height: 0),
        CGSize(width: 0, height: -110),
        CGSize(width: -110, height: 0),
        // rotation 2
        CGSize(width: 110, height: 110),
        CGSize(width: 110, height: -110),
        CGSize(width: -110, height: -110),
        // rotation 3
        CGSize(width: 0, height: 110),
        CGSize(width: 110, height: 0),
        CGSize(width: 0, height: -110),
        // final resetting rotation
        CGSize(width: 0, height: 0),
        CGSize(width: 0, height: 0),
        CGSize(width: 0, height: 0),
    ]

    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()

            // Loader view
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    Rectangle()
                        .fill(Color("box1"))
                        .frame(width: 100, height: 100)
                        .offset(offsets[0])
                }
                // with spacing 100 + 100 + 10
                .frame(width: 210, alignment: .leading)

                HStack(spacing: 10) {
                    Rectangle()
                        .fill(Color("box2"))
                        .frame(width: 100, height: 100)
                        .offset(offsets[1])

                    Rectangle()
                        .fill(Color("box3"))
                        .frame(width: 100, height: 100)
                        .offset(offsets[2])
                }
            }
        }
        .onAppear(perform: doAnimation)
        .onReceive(timer, perform: { _ in
            // Resetting timer
            print("reDo Animation")
            delayTime = 0
            doAnimation()
        })
    }

    func doAnimation() {
        // Doing our animation here...

        // Since we have three offsets so we're going to convert this array
        // to subarrays of max three elements
        // You can directly declare as subarrays
        // I'm doing like this it's your choice
        var tempOffsets: [[CGSize]] = []
        var currentSet: [CGSize] = []
        for location in locations {
            currentSet.append(location)
            if currentSet.count == 3 {
                // Appending to main array
                tempOffsets.append(currentSet)
                // clearing
                currentSet.removeAll()
            }
        }

        // Checking if any incomplete array
        if !currentSet.isEmpty {
            tempOffsets.append(currentSet)
            currentSet.removeAll()
        }

        // Animation
        for offset in tempOffsets {
            for index in offset.indices {
                // Each box shift will take 0.5 sec to finish
                // So delay will be 0.3 and its multiplies
                doAnimation(delay: .now() + delayTime, value: offset[index], index: index)
                delayTime += 0.3
            }
        }
    }

    func doAnimation(delay: DispatchTime, value: CGSize, index: Int) {
        DispatchQueue.main.asyncAfter(deadline: delay) {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.offsets[index] = value
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Just cancel timer when new page open or closed...
