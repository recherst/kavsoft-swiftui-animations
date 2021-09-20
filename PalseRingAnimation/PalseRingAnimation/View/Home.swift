//
//  Home.swift
//  PalseRingAnimation
//
//  Created by recherst on 2021/8/8.
//

import SwiftUI

struct Home: View {
    @State var startAnimation = false
    @State var pulse1 = false
    @State var pulse2 = false

    // Found People
    // Max people will be 5
    // remaining all showing in bottomsheet
    @State var foundPeople: [People] = []

    @State var finishAnimation = false

    var body: some View {
        VStack {
            // Nav bar...
            HStack(spacing: 10) {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.black)
                })

                Text(finishAnimation ? "\(peoples.count) people NearBy" : "NearBy Search")
                    .font(.title2)
                    .fontWeight(.bold)
                    .animation(.none)

                Spacer()

                Button(action: verifyAndAddPeople, label: {
                    // Show refresh button if finish animation toggle
                    if finishAnimation {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.black)
                    } else {
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.black)
                    }
                })
                .animation(.none)
            }
            .padding()
            .padding(.top, safeArea.top)
            .background(Color.white)

            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.6))
                    .frame(width: 130, height: 130)
                    .scaleEffect(pulse1 ? 3.3 : 0)
                    .opacity(pulse1 ? 0 : 1)

                Circle()
                    .stroke(Color.gray.opacity(0.6))
                    .frame(width: 130, height: 130)
                    .scaleEffect(pulse2 ? 3.3 : 0)
                    .opacity(pulse2 ? 0 : 1)

                Circle()
                    .fill(Color.white)
                    .frame(width: 130, height: 130)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)

                Circle()
                    .stroke(Color.blue, lineWidth: 1.4)
                    .frame(width: finishAnimation ? 70 : 30, height: finishAnimation ? 70 : 30)
                    .overlay(
                        Image(systemName: "checkmark")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                            .opacity(finishAnimation ? 1 : 0)
                    )

                ZStack {
                    Circle()
                        .trim(from: 0, to: 0.4)
                        .stroke(Color.blue, lineWidth: 1.4)

                    Circle()
                        .trim(from: 0, to: 0.4)
                        .stroke(Color.blue, lineWidth: 1.4)
                        .rotationEffect(Angle(degrees: -180))
                }
                .frame(width: 70, height: 70)
                .rotationEffect(Angle(degrees: startAnimation ? 360 : 0))
                // Showing found people
                ForEach(foundPeople) { people in
                    Image(people.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(4)
                        .background(Color.white.clipShape(Circle()))
                        .offset(people.offset)
                }

            }
            .frame(maxHeight: .infinity)

            if finishAnimation {
                VStack {
                    // Pull up indicator
                    Capsule()
                        .fill(Color.gray.opacity(0.7))
                        .frame(width: 50, height: 4)
                        .padding(.vertical, 10)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 15) {
                            // Since we're only locating first 5 people in pulse animation
                            // So show all people here
                            ForEach(peoples) { people in
                                VStack(spacing: 15) {
                                    Image(people.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                    Text(people.name)
                                        .font(.title2)
                                        .fontWeight(.bold)

                                    Button(action: {}, label: {
                                        Text("Choose")
                                            .fontWeight(.semibold)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 40)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    })
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding()
                        .padding(.bottom, safeArea.bottom)
                    })
                }
                .background(Color.white)
                .cornerRadius(25)
                // bottom slide
                .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
        .background(Color.black.opacity(0.05).ignoresSafeArea())
        .onAppear {
            animationView()
        }
    }

    func verifyAndAddPeople() {
        if foundPeople.count < 5 {
            // Adding people
            withAnimation {
                var people = peoples[foundPeople.count]
                // Setting custom offset for top five found people
                people.offset = firstFiveOffsets[foundPeople.count]
                foundPeople.append(people)
            }
        } else {
            // Finishing animation and showing bottom sheet
            withAnimation(Animation.linear(duration: 0.6)) {
                finishAnimation.toggle()

                // Resetting all animation
                startAnimation = false
                pulse1 = false
                pulse2 = false
            }

            // Check if animation finished
            // If so reset all
            if !finishAnimation {
                withAnimation {
                    foundPeople.removeAll()
                }
                animationView()
            }
        }
    }

    func animationView() {
        withAnimation(Animation.linear(duration: 1.7).repeatForever(autoreverses: false)) {
            startAnimation.toggle()
        }

        // It will start next round 0.1s eariler
        withAnimation(
            Animation.linear(duration: 1.7)
                .delay(-0.1)
                .repeatForever(autoreverses: false)
        ) {
            pulse1.toggle()
        }

        // 2nd pulse animation
        // will start 0.5 delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(
                Animation.linear(duration: 1.7)
                    .delay(-0.1)
                    .repeatForever(autoreverses: false)
            ) {
                pulse2.toggle()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extending View to get Safearea and screen size
extension View {
    var safeArea: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }

    var rect: CGRect {
        UIScreen.main.bounds
    }
}
