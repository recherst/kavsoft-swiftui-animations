//
//  HeaderView.swift
//  AnimatedStickyHeader
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("kavsoft Backery")
                .font(.title)
                .fontWeight(.bold)

            Text("Asiatisch . Koreanisch . Japnisch")
                .font(.caption)

            HStack(spacing: 8) {
                Image(systemName: "clock")
                    .font(.caption)

                Text("30-40 Mins")
                    .font(.caption)

                Text("4.3")
                    .font(.caption)

                Image(systemName: "star.fill")
                    .font(.caption)

                Text("$6.40 Fee")
                    .font(.caption)
                    .padding(.leading, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(Color.white)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
