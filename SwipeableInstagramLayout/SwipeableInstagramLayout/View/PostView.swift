//
//  PostView.swift
//  SwipeableInstagramLayout
//
//  Created by recherst on 2021/8/27.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        ZStack {
            // Camera view
            // Will be implemented later
            Color.black
            VStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "gear")
                            .font(.title)
                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "xmark")
                            .font(.title)
                    })
                }
                .foregroundColor(.white)
                .padding()

                Spacer()

                Button(action: {}, label: {
                    Image(systemName: "photo")
                        .font(.title)
                })
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .padding(.top, edges?.top ?? 15)
            .padding(.bottom, edges?.bottom)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}