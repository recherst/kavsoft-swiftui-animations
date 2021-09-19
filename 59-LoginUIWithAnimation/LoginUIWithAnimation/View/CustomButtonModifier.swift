//
//  CustomButtonModifier.swift
//  LoginUIWithAnimation
//
//  Created by recherst on 2021/9/17.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {

    func body(content: Content) -> some View {
        return content
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 35)
            .background(
                LinearGradient(
                    gradient: .init(colors: [Color("yellow-light"), Color("yellow")]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(Capsule())
    }
}
