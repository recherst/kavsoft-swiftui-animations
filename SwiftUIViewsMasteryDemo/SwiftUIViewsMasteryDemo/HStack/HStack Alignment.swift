//
//  HStack Alignment.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/5.
//

import SwiftUI

struct HStack_Alignment: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("HStack")
            Text("Vertical Alignment")
                .foregroundColor(.gray)
                .font(.title)
            Text("By Default, views within an HStack are vertically aligned in the center.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.orange)

            HStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Top")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.orange)

            HStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Bottom")
                Spacer()
                Text("Trailing")
                    .padding(.trailing)
            }
            .border(Color.orange)

        }
        .font(.title)
    }
}

struct HStack_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        HStack_Alignment()
    }
}
