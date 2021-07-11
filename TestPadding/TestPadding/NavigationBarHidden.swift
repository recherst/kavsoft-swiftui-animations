//
//  NavigationBarHidden.swift
//  TestPadding
//
//  Created by 刘勇刚 on 2021/7/12.
//

import SwiftUI

struct NavigationBarHidden: View {
    @State private var isHidden = true
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3BackgroundColor")
                VStack(spacing: 25) {
                    Image(systemName: "globe")
                        .font(.largeTitle)
                    Text("NavigationView")
                        .font(.largeTitle)
                    Text("Navigation Bar Hidden")
                        .foregroundColor(.gray)
                    Image("NavBarHidden")
                    Text("If you don't want to show a navigatin bar, you can use the navigationbarHidden modifier to hide it.")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("Theme3ForegroundColor"))
                        .foregroundColor(Color("Theme3BackgroundColor"))

                    Spacer()
                }
                .font(.title)
                .padding(.top, 70)
            }
            .navigationBarTitle(Text("Navigation Views"))
            .navigationBarHidden(isHidden)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct NavigationBarHidden_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarHidden()
    }
}
