//
//  Button with Images.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/10.
//

import SwiftUI

struct Button_with_Images: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Button")
                .font(.largeTitle)
            Text("With Images")
                .font(.title)
                .foregroundColor(.gray)
            Text("Buttons work fine with the SF Symbol. But what if you wanted to used a photo? Look what happens:")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .foregroundColor(Color.purple)

            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("yosemite")
                    .resizable()
                    .cornerRadius(40)
            }
        }
    }
}

struct Button_with_Images_Previews: PreviewProvider {
    static var previews: some View {
        Button_with_Images()
    }
}
