//
//  Login.swift
//  LoginUIWithAnimation
//
//  Created by recherst on 2021/9/17.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    @Namespace var animation

    @State var show = false

    var body: some View {
        VStack {

            Spacer(minLength: 0)

            HStack {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Login")
                        .font(.system(size: 40, weight: .heavy))
                        // For dark mode adoption
                        .foregroundColor(.primary)

                    Text("Please sign in to continue")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                })

                Spacer(minLength: 0)
            }
            .padding()
            .padding(.leading)

            CustomTextField(image: "envelope", title: "EMAIL", value: $email, animation: animation)

            CustomTextField(image: "lock", title: "PASSWORD", value: $password, animation: animation)
                .padding(.top, 5)

            HStack {
                Spacer(minLength: 0)

                VStack(alignment: .trailing, spacing: 20, content: {
                    Button(action: {}, label: {
                        Text("FORGOT")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("yellow"))
                    })
                })
            }
            .padding()
            .padding(.top, 10)
            .padding(.trailing)

            Spacer(minLength: 0)

            HStack(spacing: 8) {
                Text("Don't have an account?")
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)

                NavigationLink(
                    destination: Register(show: $show),
                    isActive: $show,
                    label: {
                        Text("sign up")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("yellow"))
                    })
            }
            .padding()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
