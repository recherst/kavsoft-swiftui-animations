//
//  ContentView.swift
//  PalseRingAnimation
//
//  Created by recherst on 2021/8/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    @State var startAnimation = false
    @State var pulse1 = false
    @State var pulse2 = false

    var body: some View {
        VStack {
            // Nav bar...
            HStack(spacing: 10) {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.black)
                })

                Text("NearBy Search")
                    .font(.title2)
                    .fontWeight(.bold)

                Spacer()

                Button(action: {}, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.black)
                })
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

                ZStack {
                    Circle()
                        .stroke(Color.blue, lineWidth: 1.4)
                        .frame(width: 30, height: 30)

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
            }
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .background(Color.black.opacity(0.05).ignoresSafeArea())
        .onAppear {
            animationView()
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

// Extending View to get Safearea and screen size
extension View {
    var safeArea: UIEdgeInsets {
        UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
    }

    var rect: CGRect {
        UIScreen.main.bounds
    }
}
