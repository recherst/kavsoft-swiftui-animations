//
//  ContentView.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Layout Behavior")
            Text("Views that Push Out")
                .font(.title)
                .foregroundColor(.gray)
            Text("Some views will push out to fill up all available space within their parent.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.purple)
                .layoutPriority(1)

            Color.purple
                // add 5 layers on top the color view
                .overlay(
                    Image(systemName: "arrow.up.left")
                        .padding()
                    , alignment: .topLeading
                )
                .overlay(
                    Image(systemName: "arrow.up.right")
                        .padding()
                    , alignment: .topTrailing
                )
                .overlay(
                    Image(systemName: "arrow.down.left")
                        .padding()
                    , alignment: .bottomLeading
                )
                .overlay(
                    Image(systemName: "arrow.down.right")
                        .padding()
                    , alignment: .bottomTrailing
                )
                .overlay(
                    Text("Colors are Push-Out views")
                        .padding()
                        .font(.title)
                )
        }
        .font(.largeTitle)
        // make all text and symbols larger
    }
}

//struct ContentView: View {
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Title")
//                .font(.largeTitle)
//            Text("Subtitle")
//                .font(.title)
//                .foregroundColor(.gray)
//            Text("Short description of what I am demonstrating goes here.")
//                .frame(maxWidth: .infinity)
//                .font(.title)
//                .foregroundColor(.white)
//                .padding()
//                .background(Color.blue)
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
