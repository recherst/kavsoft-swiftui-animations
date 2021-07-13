//
//  NavigationViewIntro.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/11.
//

import SwiftUI

struct NavigationViewIntro: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3BackgroundColor")
                VStack(spacing: 25) {
                    Image(systemName: "globe")
                        .font(.largeTitle)
                    Text("NavigationView")
                        .font(.largeTitle)
                    Text("Introduction")
                        .foregroundColor(.gray)
                    Text("Having a NavigationView will show nothing unless you also include a navigationBarTitle modifier.")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("Theme3ForegroundColor"))
                        .foregroundColor(Color("Theme3BackgroundColor"))
                        .layoutPriority(1)

                    Spacer()
                }
                .font(.title)
                .padding(.top, 25)
            }
            .navigationBarTitle(Text("Navigation Views"))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

// The navigationBarTitle goes INSIDE the NavigationView, not on it. Notice the default style
// of the title is large

struct NavigationViewIntro_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewIntro()
    }
}
