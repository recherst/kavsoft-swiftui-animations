//
//  Home.swift
//  StackingElements
//
//  Created by recherst on 2021/10/8.
//

import SwiftUI

struct Home: View {
    @State var designTools = [
        Tools(id: 0, image: "sketch", name: "Sketch", offset: 0, place: 1),
        Tools(id: 1, image: "figma", name: "Figma", offset: 0, place: 2),
        Tools(id: 2, image: "xd", name: "XD", offset: 0, place: 3),
        Tools(id: 3, image: "ilustrator", name: "Ilustrator", offset: 0, place: 4),
        Tools(id: 4, image: "ps", name: "Photoshop", offset: 0, place: 5),
        Tools(id: 5, image: "invision", name: "Invision", offset: 0, place: 6),
        Tools(id: 6, image: "affinity", name: "Affinity Photos", offset: 0, place: 7)
    ]
    // To track which card is swiped
    @State var swiped = 0
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Products")
                        .font(.system(size: 45))
                        .foregroundColor(.white)

                    HStack(spacing: 15) {
                        Text("Design tools")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white.opacity(0.7))

                        Button(action: {}, label: {
                            Image(systemName: "chevron.down")
                                .font(.system(size: 30))
                                .foregroundColor(Color("orange"))
                        })
                    }
                })

                Spacer(minLength: 0)
            }
            .padding()

            // Stacked Elements
            GeometryReader { reader in
                ZStack {
                    // ZStack will overlay on one another so revesing
                    ForEach(designTools.reversed()) { tool in
                        CardView(tool: tool, reader: reader, swiped: $swiped)
                            .offset(x: tool.offset)
                            .rotationEffect(.init(degrees: getRotation(offset: tool.offset)))
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        // Update position
                                        withAnimation {
                                            // Only left swipe
                                            if value.translation.width > 0 {
                                                designTools[tool.id].offset = value.translation.width
                                            }
                                        }
                                    })
                                    .onEnded({ value in
                                        withAnimation {
                                            if value.translation.width > 150 {
                                                designTools[tool.id].offset = 1000
                                                // Update swipe id
                                                // Since its starting from 0 
                                                swiped = tool.id + 1

                                                restoreCard(id: tool.id)
                                            } else {
                                                designTools[tool.id].offset = 0
                                            }
                                        }
                                    })
                            )
                    }
                }
                .offset(y: -25)
            }
        }
        .background(
            LinearGradient(gradient: .init(colors: [Color("top"), Color("center"), Color("bottom")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }

    // Add card to list
    func restoreCard(id: Int) {
        var currentCard = designTools[id]
        // append last
        currentCard.id = designTools.count

        designTools.append(currentCard)

        // Go back effect
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                // last one we append
                designTools[designTools.count - 1].offset = 0
            }
        }
    }

    // Rotation
    func getRotation(offset: CGFloat) -> Double {
        let value = offset / 150

        // You can give your own angle here
        let angle: CGFloat = 10

        let degree = Double(value * angle)

        return degree
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
