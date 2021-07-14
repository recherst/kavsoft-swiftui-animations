//
//  ImportedFonts.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct ImportedFonts: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Imported Fonts")
                .font(.title)
                .foregroundColor(.gray)
            Text("Use the Font.custom() function to set imported fonts you added to your project.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.green)
                .foregroundColor(.white)

            Text("Hello World!")
                .font(Font.custom("Nightcall", size: 60))
                .padding(.top)
        }
    }
}

// In order for this to work, you have to add the font file to your project and be sure to have
// the font file target your project. Then you need to add the font file name to the Info.plist
// under the "Fonts provided by application" key.

struct ImportedFonts_Previews: PreviewProvider {
    static var previews: some View {
        ImportedFonts()
    }
}
