//
//  Safe Area Insets.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/9.
//

import SwiftUI

struct Safe_Area_Insets: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("GeometryReader")
            Text("SafeAreaInsets")
                .foregroundColor(.gray)
                .font(.title)
            Text("GeometryReader can also tell you the safe area insets it has.")

            GeometryReader { geometry in
                VStack {
                    Text("geometry.safeAreaInsets.leading: \(geometry.safeAreaInsets.leading)")
                    Text("geometry.safeAreaInsets.trailing: \(geometry.safeAreaInsets.trailing)")
                    Text("geometry.safeAreaInsets.top: \(geometry.safeAreaInsets.top)")
                    Text("geometry.safeAreaInsets.bottom: \(geometry.safeAreaInsets.bottom)")
                }
            }
            .font(.title)
            .background(Color.pink)
            .foregroundColor(.white)
        }
        .font(.largeTitle)
    }
}

struct Safe_Area_Insets_Previews: PreviewProvider {
    static var previews: some View {
        Safe_Area_Insets()
            .previewLayout(PreviewLayout.fixed(width: 844, height: 390))
            .environment(\.horizontalSizeClass, .compact)
    }
}
