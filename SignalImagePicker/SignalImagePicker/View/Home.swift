//
//  Home.swift
//  SignalImagePicker
//
//  Created by recherst on 2021/8/26.
//

import SwiftUI

struct Home: View {
    @State var message = ""
    var body: some View {
        NavigationView {
            // Sample signal chat view
            VStack {
                ScrollView {

                }

                HStack(spacing: 15) {
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.gray)
                    })

                    TextField("New Message", text: $message)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.primary.opacity(0.06))
                        .clipShape(Capsule())

                    Button(action: {}, label: {
                        Image(systemName: "camera")
                            .font(.title2)
                            .foregroundColor(.gray)
                    })

                    Button(action: {}, label: {
                        Image(systemName: "mic")
                            .font(.title2)
                            .foregroundColor(.gray)
                    })
                }
                .padding(.horizontal)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Back button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}, label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)

                    })
                }

                // Profile

                ToolbarItem(id: "PROFILE", placement: .navigationBarLeading, showsByDefault: true) {
                    HStack(spacing: 8) {
                        // Use your image or profile image here
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("K")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )

                        Text("Kavsoft")
                            .fontWeight(.semibold)

                        Image(systemName: "person.circle")
                            .font(.caption)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "camera")
                            .font(.title2)

                    })
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "phone")
                            .font(.title2)

                    })
                }
            }
        }
        // Colors will not work on navigation bar
        // But use accent color to change
        .accentColor(.primary)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
