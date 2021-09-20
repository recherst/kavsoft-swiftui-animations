//
//  Register.swift
//  LoginUIWithAnimation
//
//  Created by recherst on 2021/9/17.
//

import SwiftUI

struct Register: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var number = ""

    @Binding var show: Bool

    @Namespace var animation

    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                HStack {
                    Button(action: {
                        show.toggle()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    })

                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.leading)

                HStack {
                    Text("Create Account")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)

                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.leading)

                CustomTextField(image: "person", title: "FULL NAME", value: $name, animation: animation)

                CustomTextField(image: "envelope", title: "EMAIL", value: $email, animation: animation)
                    .padding(.top, 5)

                CustomTextField(image: "lock", title: "PASSWORD", value: $password, animation: animation)
                    .padding(.top, 5)

                CustomTextField(image: "phone.fill", title: "PHONE NUMBER", value: $number, animation: animation)
                    .padding(.top, 5)

                HStack {
                    Spacer()

                    Button(action: {}, label: {
                        HStack(spacing: 10) {
                            Text("SIGN UP")
                                .fontWeight(.heavy)

                            Image(systemName: "arrow.right")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())

                    })
                }
                .padding()
                .padding(.top)
                .padding(.trailing)

                HStack {
                    Text("Already have a account?")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)

                    Button(action: {
                        show.toggle()
                    }, label: {
                        Text("sign in")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("yellow"))
                    })
                }
                .padding()
                .padding(.top, 10)

                Spacer(minLength: 0)
            }
        })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
