//
//  TruncationMode.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct TruncationMode: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Truncation Mode")
                .font(.title)
                .foregroundColor(.gray)
            Image("TruncationMode")
                .resizable()
                .frame(width: 40, height: 40)
            Text("When text gets truncated, you can ccontrol where the ellipsis (...) shows.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)

            Text("Default: .truncationMode(.tail)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
            // Text automatically defaults an end
            Text("This will be the best day of your life!")
                .padding(.horizontal)
                .lineLimit(1)
            Text(".truncationMode(.middle)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
            Text("This will be the best day of your life!")
                // Truncate in middle
                .truncationMode(.middle)
                .padding(.horizontal)
                .lineLimit(1)
            Text(".truncateMode(.head)")
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
            Text("This will be the best day of your life!")
                // Truncate in beginning
                .truncationMode(.head)
                .padding(.horizontal)
                .lineLimit(1)
        }
        .font(.title)
    }
}

struct TruncationMode_Previews: PreviewProvider {
    static var previews: some View {
        TruncationMode()
    }
}
