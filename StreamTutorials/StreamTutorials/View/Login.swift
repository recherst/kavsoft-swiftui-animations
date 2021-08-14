//
//  Login.swift
//  StreamTutorials
//
//  Created by recherst on 2021/8/14.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var streamData: StreamViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {

        VStack {
            TextField("iJustine", text: $streamData.userName)
                .modifier(ShadowModifier())
                .padding(.top, 30)

            Button(action: streamData.logInUser, label: {

                HStack {
                    Spacer()

                    Text("Login")

                    Spacer()

                    Image(systemName: "arrow.right")
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.primary)
                .foregroundColor(colorScheme == .dark ? .black : .white)
                .cornerRadius(5)
            })
            .padding(.top, 20)
            .disabled(streamData.userName == "")
            .opacity(streamData.userName == "" ? 0.5 : 1)

            Spacer()
        }
        .padding()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Create a modifier for shadow os that it can be used for some other views
struct ShadowModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        return content
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(colorScheme != .dark ? Color.white : Color.black)
            .cornerRadius(8)
            .clipped()
            .shadow(color: Color.primary.opacity(0.04), radius: 5, x: 5, y: 5)
            .shadow(color: Color.primary.opacity(0.04), radius: 5, x: -5, y: -5)

    }
}
