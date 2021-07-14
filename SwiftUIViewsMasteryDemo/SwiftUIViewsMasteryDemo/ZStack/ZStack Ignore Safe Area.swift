//
//  ZStack Ignore Safe Area.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/6.
//

import SwiftUI

struct ZStack_Ignore_Safe_Area: View {
    var body: some View {
        ZStack {
            Color.gray

            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)

                Text("Edges Ignoring Safe Area")
                    .foregroundColor(.white)
                Text("Ignoring the Safe Areas will extend a view to fill the whole scene.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
            }
            .font(.title)
        }
        // Ignore the safe areas
        // Allows views to extend into the safe areas.
        .edgesIgnoringSafeArea(.all)
    }
}

struct ZStack_Ignore_Safe_Area_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_Ignore_Safe_Area()
    }
}
