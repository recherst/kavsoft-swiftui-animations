//
//  BottomSheet.swift
//  VPNAppUI
//
//  Created by recherst on 2021/9/16.
//

import SwiftUI

struct BottomSheet: View {
    @StateObject var serverData: ServerViewModel

    var edges = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 18) {
                Capsule()
                    .fill(Color.gray)
                    .frame(width: 60, height: 4)

                Text("SELECT SERVER")
                    .foregroundColor(.gray)

                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 10) {
                        ForEach(serverData.servers) { server in
                            CardView(server: server)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom)
                    .padding(.bottom, edges?.bottom)
                })
                .frame(height: UIScreen.main.bounds.height / 3)
            }
            .padding(.top)
            .background(BlurView())
        }
        .ignoresSafeArea()
        .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
