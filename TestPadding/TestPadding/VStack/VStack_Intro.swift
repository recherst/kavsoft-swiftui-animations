//
//  VStack_Intro.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/5.
//

import SwiftUI

struct VStack_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 20) {
                Text("VStack")
                Text("Introduction")
                    .font(.title)
                    .foregroundColor(.gray)
                Text("A VStack will vertically arrange other views within it.")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
            Text("View 1")
            Text("View 2")
            Text("View 3")
            Text("View 4")
            Text("View 5")
            Text("View 6")
            Text("View 7")
            Text("View 8")
            Text("View 9")
        }
        .font(.title)
        // In SwiftUI, container views, like the VStack, can only contain up to 10 views.
    }
}

struct VStack_Intro_Previews: PreviewProvider {
    static var previews: some View {
        VStack_Intro()
    }
}
