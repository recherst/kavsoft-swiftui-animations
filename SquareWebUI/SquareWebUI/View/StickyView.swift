//
//  StickyView.swift
//  SquareWebUI
//
//  Created by recherst on 2021/8/29.
//

import SwiftUI

struct StickyView: View {
    @Binding var firstMinY: CGFloat
    @Binding var minY: CGFloat
    @Binding var lastMinY: CGFloat
    @Binding var scale: CGFloat
    
    var body: some View {
        GeometryReader { reader -> AnyView in
            // Eliminating the header view height from image
            let minY = self.firstMinY - reader.frame(in: .global).minY

            // To avoid negatives
            // Your own value for scaling effect
            let progress = (minY > 0 ? minY : 0) / 200

            let scale = (1 - progress) * 1

            // Image scaling
            // Only 0.1 scaling for inner image
            let imageScale = (scale / 0.6) > 0.9 ? (scale / 0.6) : 0.9
            // Image offset
            let imageOffset = imageScale > 0 ? (1 - imageScale) * 200 : 20

            DispatchQueue.main.async {
                if self.firstMinY == 0 {
                    self.firstMinY = reader.frame(in: .global).minY
                }
                self.minY = minY
                // Get last MinY value when the scale reached 0.4
                if scale < 0.4 && lastMinY == 0 {
                    self.lastMinY = minY
                }

                self.scale = scale
            }
            return AnyView(
                Image("p5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: rect.width, height: rect.height - firstMinY)
                    .cornerRadius(1)
                    .scaleEffect(scale < 0.6 ? imageScale : 1)
                    .offset(y: scale < 0.6 ? imageOffset : 0)
                    .overlay(
                        ZStack {
                            VStack {
                                Text("CREATE WEBSITE")
                                    .font(.title2)
                                    .fontWeight(.bold)

                                Text("The leader in\nwebsite design")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 10)
                            }
                            .foregroundColor(.white)
                            .offset(y: 15)
                            // Hide before scale 0.6
                            .opacity(Double(scale - 0.7) / 0.3)

                            // Show info details
                            Text("Seattle Based\nPhotogrpher")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .scaleEffect(1.5)
                                .opacity(0.1 - Double(scale - 0.7) / 0.3)


                        }
                    )
                    .background(
                        ZStack {
                            // Only show after 0.6
                            if scale < 0.6 {
                                // BG and info card
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white.opacity(0.6))

                                VStack {
                                    HStack {
                                        Text("Mark Novo")
                                            .font(.title)
                                            .fontWeight(.bold)

                                        Spacer()

                                        ForEach(1...3, id: \.self) { _ in
                                            Circle()
                                                .fill(Color.gray)
                                                .frame(width: 15, height: 15)
                                        }
                                    }
                                    .padding()

                                    Spacer()
                                }
                            }
                        }
                    )
                    // Limit
                    .scaleEffect(scale > 0.6 ? scale : 0.6)
                    // logic to move view up when it reaches button
                    .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
                    .offset(y: scale > 0.6 ? (scale - 1) * 200 : -80)
            )
        }
        .frame(width: rect.width, height: rect.height - firstMinY)
        .overlay(
            // Bottom details
            VStack {
                Text("Stand Out Online with a professional\nwebsite, online store, or portfolio.")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Button(action: {}, label: {
                    Text("Get Started")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .padding(.horizontal, 30)
                        .background(Color.white)
                })
                .padding(.top, 10)
            }
            .padding(.bottom, 70)
            // Disabling scroll
            .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)

            , alignment: .bottom
        )
    }
}

struct StickyView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
