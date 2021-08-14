//
//  CreateNewChannel.swift
//  StreamTutorials
//
//  Created by recherst on 2021/8/14.
//

import SwiftUI

struct CreateNewChannel: View {
    @EnvironmentObject var streamData: StreamViewModel
    @Environment(\.colorScheme) var scheme
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Text("Create New Channel")
                .font(.title2)
                .fontWeight(.bold)

            TextField("iJustine", text: $streamData.channelName)
                .modifier(ShadowModifier())

            // Button
            Button(action: streamData.createChannel, label: {
                Text("Create Channel")
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.primary)
                    .foregroundColor(scheme == .dark ? .black : .white)
                    .cornerRadius(8)
            })
            .padding(.top, 10)
            .disabled(streamData.channelName == "")
            .opacity(streamData.channelName == "" ? 0.5 : 1)
        })
        .padding()
        .background(scheme == .dark ? Color.black : Color.white)
        .cornerRadius(12)
        .padding(.horizontal, 35)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.2)
                .ignoresSafeArea()
                .onTapGesture {
                    streamData.channelName = ""
                    withAnimation {
                        streamData.createNewChannel.toggle()
                    }
                }
        )
    }
}

struct CreateNewChannel_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewChannel()
    }
}
