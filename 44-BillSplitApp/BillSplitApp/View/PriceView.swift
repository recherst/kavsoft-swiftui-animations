//
//  PriceView.swift
//  BillSplitApp
//
//  Created by recherst on 2021/9/8.
//

import SwiftUI

// Price spilit view
struct PriceView: View {
    @Binding var payer: Payer
    var totalAmount: CGFloat
    var body: some View {
        VStack(spacing: 15) {
            // Custom Slider
            HStack {
                Image(payer.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .background(payer.bgColor)
                    .clipShape(Circle())

                Text(payer.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()

                Text(price)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }

            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                Capsule()
                    .fill(Color.black.opacity(0.25))
                    .frame(height: 30)

                Capsule()
                    .fill(payer.bgColor)
                    .frame(width: payer.offset + 20, height: 30)

                // Dots
                HStack(spacing: (UIScreen.main.bounds.width - 100) / 12) {
                    ForEach(0..<12, id: \.self) { index in
                        Circle()
                            .fill(Color.white)
                            .frame(
                                width: index % 4 == 0 ? 7 : 4,
                                height: index % 4 == 0 ? 7 : 4
                            )
                    }
                }
                .padding(.leading)

                Circle()
                    .fill(Color("card"))
                    .frame(width: 35, height: 35)
                    .background(Circle().stroke(Color.white, lineWidth: 5))
                    .offset(x: payer.offset)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                // Padding horizontal
                                // Padding horizontal = 30
                                // Circle radius = 20
                                // Total 50
                                if value.location.x > 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                    // Circle radius = 20
                                    payer.offset = value.location.x - 20
                                }
                            })
                    )
            })
        }
        .padding()
    }

    // Calculate price
    var price: String {
        let percent = payer.offset / (UIScreen.main.bounds.width - 70)
        let amount = percent * (totalAmount / 3)
        return String(format: "%.2f", amount)
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
