//
//  Button with Borders.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct Button_with_Borders: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("With Borders")
                .font(.title)
                .foregroundColor(.gray)
            Text("Applying borders can add a nice effect to your buttons. Here are some options.")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)
                .font(.title)

            Button(action: {}) {
                Text("Square Border Button")
                    .padding()
                    .border(Color.purple)
            }

            Button(action: {}) {
                Text("Rounded Border Button")
                    .padding()
                    .border(Color.purple)
                    .cornerRadius(10)
            }

            Text("Look what happend when I tried to add a corner radius to the border. It is clipping the corners. Here is a different way you can accomplish this:")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .foregroundColor(.white)
                .font(.title)

            Button(action: {}) {
                Text("Border Button")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 2)
                    )
            }
        }
    }
}

struct Button_with_Borders_Previews: PreviewProvider {
    static var previews: some View {
        Button_with_Borders()
            .preferredColorScheme(.dark)
    }
}
