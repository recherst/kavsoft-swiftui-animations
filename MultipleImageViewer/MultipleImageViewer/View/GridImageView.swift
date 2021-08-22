//
//  GridImageView.swift
//  MultipleImageViewer
//
//  Created by recherst on 2021/8/22.
//

import SwiftUI

struct GridImageView: View {
    @EnvironmentObject var homeData: HomeViewModel
    var index: Int

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                // For page tab view automatic scrolling
                homeData.selectedImageID = homeData.allImages[index]
                homeData.showImageViewer.toggle()
            }
        }, label: {
            ZStack {
                // Show only four grids
                if index <= 3 {
                    Image(homeData.allImages[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getWidth(index: index), height: 120)
                        .cornerRadius(12)
                }

                // Show the count of remaining images
                if homeData.allImages.count > 4 && index == 3 {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.black.opacity(0.3))

                    let remainingImages = homeData.allImages.count - 4
                    Text("+\(remainingImages)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
            }
        })
    }

    // Expand image size when space is availble
    func getWidth(index: Int) -> CGFloat {
        let width = rect.width - 100
        if homeData.allImages.count % 2 == 0 {
            return width / 2
        } else {
            if index == homeData.allImages.count - 1 {
                return width
            } else {
                return width / 2
            }
        }
    }
}

struct GridImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    var rect: CGRect {
        UIScreen.main.bounds
    }
}
