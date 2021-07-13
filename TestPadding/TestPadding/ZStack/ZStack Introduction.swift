//
//  ZStack Introduction.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/6.
//

import SwiftUI

// A ZStack is ca pull-in container view. it is a view that overlays its child views
// on top of each other. ("Z" represents the Z-axis which is depth-based in a 3D space.)

// You learned earlier about creating layers with the background and overlay modifiers. ZStack is another way to create layers with views that control their own sizing and spacing.

// The ZStack is a pull-in container view. You may think it is a push-out view because of the first example but it's actually the color thai is pushing out.
struct ZStack_Introduction: View {
    var body: some View {
        ZStack {
            // LAYER 1: Furthest back
            Color.gray // Yes, Color is a View!

            // LAYER 2: This VStack is on top.
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)

                Text("Introduction")
                    .foregroundColor(.white)

                Text("ZStack are great for setting a background color.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)

                Text("But notice the Color stops at the Safe Areas (white areas on top and bottom).")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
            }
            .font(.title)
        }
    }
}

struct ZStack_Introduction_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_Introduction()
    }
}

// You set depth by the order of the views inside the ZStack.

// Note: The Color view is a push-out view. It is pushing out the ZStack container view.
