//
//  BottomSheet.swift
//  VPNAppUI
//
//  Created by recherst on 2021/9/16.
//

import SwiftUI

struct BottomSheet: View {
    @ObservedObject var serverData: ServerViewModel

    var edges = UIApplication.shared.windows.first?.safeAreaInsets

    @State var offset: CGFloat = 0

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 12) {
                Capsule()
                    .fill(Color.gray)
                    .frame(width: 60, height: 4)

                Text("SELECT SERVER")
                    .foregroundColor(.gray)

                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 0) {
                        ForEach(serverData.servers) { server in
                            CardView(
                                server: server,
                                subtitle: serverData.currentServer.name == server.name ? "CURRENTLY SELECTED" : ""
                            )
                            .contentShape(Rectangle())
                            .onTapGesture(perform: {
                                serverData.currentServer = server
                                withAnimation {
                                    serverData.showSheet.toggle()
                                }
                            })
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    .padding(.bottom, edges?.bottom)
                })
                .frame(height: UIScreen.main.bounds.height / 3)
            }
            .padding(.top)
            .background(BlurView().clipShape(CustomCorner(corners: [.topLeft, .topRight])))
            .offset(y: offset)
            .offset(y: serverData.showSheet ? 0 : UIScreen.main.bounds.height)
        }
        .ignoresSafeArea()
        .background(
            Color.black
                .opacity(serverData.showSheet ? 0.3 : 0)
                .ignoresSafeArea()
                .onTapGesture(perform: {
                    withAnimation {
                        serverData.showSheet.toggle()
                    }
                })
        )
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
