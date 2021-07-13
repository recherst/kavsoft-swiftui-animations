//
//  Scroll Horizontally.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct Scroll_Horizontally: View {
    var items = [Color.green, Color.blue, Color.purple, Color.pink, Color.yellow, Color.orange]

    var body: some View {
        GeometryReader { gr in
            VStack(spacing: 20) {
                Text("ScrollView")
                    .font(.largeTitle)
                Text("Scroll Horizontally")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("Just set the ScrollView's axis to horizontal and if the contents go horizontally beyond the frame, scrolling will be enabled.")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .padding()
                    .background(Color("ScrollHorizontallyBackgroundColor"))
                    .foregroundColor(Color.white)

                // Set the scroll direction and if you want to show the scroll indicators
                // or Not.
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(items, id: \.self) { item in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(item)
                                .frame(width: gr.size.width - 60, height: 200)
                        }
                    }
                }
                .padding(.horizontal)
                Spacer()
            }

        }
    }
}

struct Scroll_Horizontally_Previews: PreviewProvider {
    static var previews: some View {
        Scroll_Horizontally()
    }
}
