//
//  Home.swift
//  DribbleLoadingBall
//
//  Created by recherst on 2021/8/16.
//

import SwiftUI

struct Home: View {
    @State var rotateBall = false
    @State var showPopup = false
    // Color scheme for dark mode adoption
    @Environment(\.colorScheme) var scheme

    var body: some View {
        VStack {
            Toggle(isOn: $rotateBall, label: {
                Text("Rotate Ball")
            })
            .padding()
            .padding(.vertical)

            // Custom shadow button
            Button(action: {
                withAnimation(.spring()) {
                    showPopup.toggle()
                }
            }, label: {
                Text("Show Popup")
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(scheme == .dark ? Color.black : Color.white)
                    .cornerRadius(8)
                    // Shadow
                    .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.primary.opacity(0.1), radius: 5, x: -5, y: -5)
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            ZStack {
                if showPopup {
                    Color.primary.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showPopup.toggle()
                            }
                        }

                    // Sliding from bottom
                    DribbleAnimationView(showPopup: $showPopup, rotateBall: $rotateBall)
    //                    .offset(y: showPopup ? 0 : UIScreen.main.bounds.height)
                }
            }
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct DribbleAnimationView: View {
    // Color scheme for dark mode adoption
    @Environment(\.colorScheme) var scheme
    @Binding var showPopup: Bool
    @Binding var rotateBall: Bool

    @State var animateBall = false
    @State var animateRotation = false

    var body: some View {
        ZStack {
            (scheme == .dark ? Color.black : Color.white)
                .frame(width: 150, height: 150)
                .cornerRadius(14)
                // Shadow
                .shadow(color: Color.primary.opacity(0.07), radius: 5, x: 5, y: 5)
                .shadow(color: Color.primary.opacity(0.07), radius: 5, x: -5, y: -5)

            // Ball shadow
            Circle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 40, height: 40)
                // Rotate in X axis
                .rotation3DEffect(
                    Angle(degrees: 60),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    anchor: .center,
                    anchorZ: 0.0,
                    perspective: 1.0
                )
                .offset(y: 35)
                .opacity(animateBall ? 1 : 0)
            Image("dribble")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: rotateBall && animateRotation ? 360 : 0))
                .offset(y: animateBall ? 10 : -25)
        }
        .onAppear(perform: {
            doAnimation()
        })
    }

    func doAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)) {
            animateBall.toggle()
        }

        withAnimation(Animation.linear(duration: 0.8).repeatForever(autoreverses: true)) {
            animateRotation.toggle()
        }
    }
}
