//
//  Preview_SizeCategory.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/4.
//

import SwiftUI

struct Preview_SizeCategory: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Previews")
            Text("Size Category (Accessibility Text Size)")
                .foregroundColor(.gray)
            Text("For testing accessibility text size, set the sizeCategory property.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
        }
        .font(.title)
    }
}

struct Preview_SizeCategory_Previews: PreviewProvider {
    static var previews: some View {
        Preview_SizeCategory()
//            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
//            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
//            .environment(\.sizeCategory, .accessibilityExtraLarge)
//            .environment(\.sizeCategory, .accessibilityMedium)
//            .environment(\.sizeCategory, .extraExtraExtraLarge)
//            .environment(\.sizeCategory, .extraExtraLarge)
//            .environment(\.sizeCategory, .extraSmall)
//            .environment(\.sizeCategory, .large)
//            .environment(\.sizeCategory, .medium)
            .environment(\.sizeCategory, .small)

        /*
         Options:
         case accessibilityExtraExtraExtraLarge
         case accessibilityExtraExtraLarge
         case accessibilityExtraLarge
         case extraExtraExtraLarge
         case extraExtraLarge
         case extraLarge
         case extraSmall
         case large
         case medium
         case small
         */
    }
}
