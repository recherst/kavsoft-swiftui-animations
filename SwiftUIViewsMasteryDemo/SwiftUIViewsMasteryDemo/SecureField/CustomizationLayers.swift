//
//  CustomizationLayers.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/13.
//

import SwiftUI

struct CustomizationLayers: View {
    @State private var userName = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("SecureField")
                .font(.largeTitle)
            Text("Customization Layers")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can also add a background to the SecureField. It's all the same idea: adjust the layers.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.purple)
                .foregroundColor(Color.white)

            SecureField("password", text: $password)
                .foregroundColor(Color.white)
                .frame(height: 40)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .foregroundColor(.purple)
                )
                .padding(.horizontal)

            Image("SecureFieldLayers")
                .resizable()
                .frame(height: 150)

            Text("The highlighted layer in that image is the actual text field layer of the view.")
                .font(.title)
                .padding(.horizontal)
        }
    }
}

struct CustomizationLayers_Previews: PreviewProvider {
    static var previews: some View {
        CustomizationLayers()
            .preferredColorScheme(.dark)
    }
}
