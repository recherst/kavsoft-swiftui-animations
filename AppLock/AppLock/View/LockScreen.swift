//
//  LockScreen.swift
//  AppLock
//
//  Created by recherst on 2021/9/29.
//

import SwiftUI

struct LockScreen: View {
    @State var password = ""
    // You can change it when user clicks reset password
    // AppStorage => UserDefaults
    @AppStorage("lock_password") var key = "5654"
    @Binding var unLocked: Bool
    @State var wrongPassword = false
    let height = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 0)

                Menu(content: {
                    Label(
                        title: { Text("Help") },
                        icon: { Image(systemName: "info.circle.fill") }
                    )
                    .onTapGesture {

                    }

                    Label(
                        title: { Text("Reset Password") },
                        icon: { Image(systemName: "key.fill") }
                    )
                    .onTapGesture {

                    }
                }) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .rotationEffect(.init(degrees: 90))
                        .padding()
                }
            }
            .padding(.leading)

            Image("logo")
                .resizable()
                .frame(width: 95, height: 95)
                .padding(.top, 20)

            Text("Enter Pin to Unlock")
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.top, 20)

            HStack(spacing: 22) {
                // Password circle view
                ForEach(0..<4, id: \.self) { index in
                    PasswordView(index: index, password: $password)
                }
            }
            // For smaller size iPhones
            .padding(.top, height < 750 ? 20 : 30)

            // KeyPad
            Spacer(minLength: 0)
            Text(wrongPassword ? "Incorrect Pin" : "")
                .foregroundColor(.red)
                .fontWeight(.heavy)

            Spacer(minLength: 0)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: height < 750 ? 5 : 15, content: {
                // Password button
                ForEach(1...9, id: \.self) { value in
                    PasswordButton(value: "\(value)", password: $password, key: $key, unLocked: $unLocked, wrongPass: $wrongPassword)
                }

                PasswordButton(value: "delete.fill", password: $password, key: $key, unLocked: $unLocked, wrongPass: $wrongPassword)

                PasswordButton(value: "0", password: $password, key: $key, unLocked: $unLocked, wrongPass: $wrongPassword)
            })
            .padding(.bottom)

        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct LockScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
