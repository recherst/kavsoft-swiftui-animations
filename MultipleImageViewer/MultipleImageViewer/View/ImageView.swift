//
//  ImageView.swift
//  MultipleImageViewer
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

struct ImageView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            TabView(selection: $homeData.selectedImageID, content:  {
                ForEach(homeData.allImages, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tag(image)
                }
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .overlay(
                // Close button
                Button(action: {
                    withAnimation(.default) {
                        // Remove all
                        homeData.showImageViewer.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.35))
                        .clipShape(Circle())
                })
                .padding(10)

                , alignment: .topTrailing
            )
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
