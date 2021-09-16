//
//  CardView.swift
//  VPNAppUI
//
//  Created by recherst on 2021/9/16.
//

import SwiftUI

struct CardView: View {
    var server: Server
    var subtitle: String

    var body: some View {
        HStack(spacing: 15) {
            Image(server.flag)
                .resizable()
                .frame(width: 45, height: 45)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4, content: {
                Text(server.name)
                    .font(.system(size: 22))
                    .foregroundColor(.black)

                if subtitle != "" {
                    Text(subtitle)
                        .foregroundColor(.gray)
                }
            })

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 24))
                .foregroundColor(.black)
        }
        .padding(.leading, 10)
        .padding(.trailing)
        .padding(.vertical)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
