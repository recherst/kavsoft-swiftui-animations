//
//  FriendRowView.swift
//  CustomScrollView
//
//  Created by recherst on 2021/8/16.
//

import SwiftUI

struct FriendRowView: View {
    var friend: Friend
    var body: some View {
        HStack(spacing: 15) {
            Image(friend.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 8, content: {
                Text(friend.name)
                    .fontWeight(.bold)
                Text(friend.detail)
                    .font(.caption)
                    .foregroundColor(.gray)
            })
            .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: {}, label: {
                Image(systemName: "message.fill")
                    .foregroundColor(Color("yellow"))
                    .padding()
                    .background(Color("yellow").opacity(0.2))
                    .clipShape(Circle())
            })
            .padding(.trailing, -5)

            Button(action: {}, label: {
                Image(systemName: "phone.fill")
                    .foregroundColor(Color("yellow"))
                    .padding()
                    .background(Color("yellow").opacity(0.2))
                    .clipShape(Circle())
            })
        }
        .padding(.horizontal)
    }
}

struct FriendRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
