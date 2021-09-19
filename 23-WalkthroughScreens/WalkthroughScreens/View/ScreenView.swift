//
//  ScreenView.swift
//  WalkthroughScreens
//
//  Created by recherst on 2021/8/24.
//

import SwiftUI

struct ScreenView: View {
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    @AppStorage("currentPage") var currentPage = 1

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                // Show it only for first page
                if currentPage == 1 {
                    Text("Hello Member!")
                        .font(.title)
                        .fontWeight(.semibold)
                        // Letter spacing
                        .kerning(1.4)
                } else {
                    // Back button
                    Button(action: {
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                Spacer()

                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()

            Spacer(minLength: 0)

            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)

            Text("Lorem ipsum is dummy text used in laying out print, graphic or web design.")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)

            // Minimum spacing when phone is reducing

            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
