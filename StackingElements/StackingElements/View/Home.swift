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
                        CardView(tool: tool, reader: reader)
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
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
