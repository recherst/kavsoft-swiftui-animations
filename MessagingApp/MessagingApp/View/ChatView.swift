//
//  ChatView.swift
//  MessagingApp
//
//  Created by recherst on 2021/9/28.
//

import SwiftUI

struct ChatView: View {
    var chatData: Chat
    var body: some View {
        HStack(spacing: 10) {
            Image(chatData.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8, content: {
                Text(chatData.name)
                    .fontWeight(.bold)
                    .lineLimit(1)

                Text(chatData.msg)
                    .font(.caption)
                    .lineLimit(1)
            })

            Spacer(minLength: 0)

            Text(chatData.time)
                .font(.system(size: 15))
                .fontWeight(.bold)
        }
        .padding(.horizontal)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
