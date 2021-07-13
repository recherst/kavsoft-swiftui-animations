//
//  Button With Background.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct Button_With_Background: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("With Background")
                .font(.title)
                .foregroundColor(.gray)

            Text("As with most views, we can  also customize the background and add a shadow.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)
                .font(.title)

            Button(action: {}, label: {
                Text("Solid Button")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .cornerRadius(8)
            })

            Button(action: {}) {
                Text("Button With Shadow")
                    .padding()
                    .foregroundColor(Color.white)
                    // You will learn another way to do this using Shapes in the "Other Views" chapter.
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            // See more info in section on Shadows
            .shadow(color: Color.purple, radius: 20, y: 5)

            Button(action: {}) {
                Text("Button With Rounded Ends")
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    // in iOS 13, Infinity will always give you the perfect corner no matter the size of the view.
//                    .cornerRadius(.infinity)
                    // but after iOS 14
                    .clipShape(Capsule())
            }
        }
    }
}

struct Button_With_Background_Previews: PreviewProvider {
    static var previews: some View {
        Button_With_Background()
    }
}
