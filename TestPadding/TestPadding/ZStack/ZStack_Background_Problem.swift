//
//  ZStack_Background_Problem.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/6.
//

import SwiftUI

struct ZStack_Background_Problem: View {
    var body: some View {
        ZStack {
            Color.gray

            VStack(spacing: 20) {
                // This view is under the notch (凹口，这里应该是只 iPhone 的那个刘海)
                Text("ZStack")
                    .font(.largeTitle)

                Text("Edges Ignoring Safe Area")
                    .foregroundColor(.white)

                Text("Having the ZStack edges ignoring the safe areas might be a mistake if you don't want other layers' edges to alse ignore the safe areas. You notice that the top Text view is completely under the notch.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)

                // Added a spacer to push the views up.
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ZStack_Background_Problem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_Background_Problem()
    }
}
