//
//  Home.swift
//  FBReactionAimations
//
//  Created by recherst on 2021/9/20.
//

import SwiftUI

struct Home: View {
    @State var posts = [
        Post(image: "p2",
             title: "Rumored iPhone 12 MockUp",
             time: "05:15 pm",
             liked: false,
             reaction: ""),
        Post(image: "p1",
             title: "Hi,Speed -> One Day To Go :)))",
             time: "07:15 pm",
             liked: false,
             reaction: ""),
        Post(image: "p3",
             title: "A14 :)))",
             time: "01:25 pm",
             liked: false,
             reaction: ""),
        Post(image: "p4",
             title: "ARM MacBook will Be Released at December 31 2020🤣🤣🤣",
             time: "07:15 pm",
             liked: false,
             reaction: ""),

    ]
    var body: some View {
        ZStack {
            Color("fb")
                .ignoresSafeArea(.all, edges: .top)
            Color("bg")
                .ignoresSafeArea(.all, edges: .bottom)

            VStack(spacing: 0) {
                HStack(spacing: 12) {
                    Text("facebook")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)

                    Spacer(minLength: 0)

                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                    })

                    Button(action: {}, label: {
                        Image(systemName: "message.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                    })
                }
                .padding()
                .background(Color("fb"))

                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 12) {
                        ForEach(posts) { post in
                            // Post View
                            PostView(post: post)
                                .background(Color.white)
                        }
                    }
                })
            }

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
