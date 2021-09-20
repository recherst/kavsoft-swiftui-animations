//
//  PostView.swift
//  FBReactionAimations
//
//  Created by recherst on 2021/9/20.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            VStack {
                HStack(spacing: 15) {
                    Image("profile")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 4, content: {
                        Text("Kavsoft")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)

                        Text(post.time)
                            .foregroundColor(.gray)
                    })

                    Spacer(minLength: 0)

                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                    })
                }
                .padding()

                HStack {
                    Text(post.title)
                        .foregroundColor(.black)

                    Spacer(minLength: 0)
                }
                .padding(.horizontal)

                Image(post.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 250)

                ZStack {
                    HStack {
                        Label(
                            title: {
                                Text(post.liked ? "Liked" : "Like")
                                    .fontWeight(.heavy)
                                    .foregroundColor(post.liked ? Color("fb") : .gray)
                            },
                            icon: {
                                Image(systemName: "hand.thumbsup")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(post.liked ? Color("fb") : .gray)
                            }
                        )
                        .onTapGesture {
                            post.liked.toggle()
                        }
                        .gesture(
                            DragGesture()
                                .onChanged(onChanged(value:))
                                .onEnded(onEnded(value:))

                        )

                        Spacer(minLength: 0)

                        Button(action: {}, label: {
                            Label(
                                title: {
                                    Text("Share")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.gray)
                                },
                                icon: {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 22, weight: .heavy))
                                        .foregroundColor(.gray)
                                }
                            )
                        })
                    }

                    Button(action: {}, label: {
                        Label(
                            title: {
                                Text("Comment")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.gray)
                            },
                            icon: {
                                Image(systemName: "message")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(.gray)
                            }
                        )
                    })
                }
                .padding()
            }

            ReactionView(post: $post)
                .offset(y: -80)
                .padding(.leading)
        }
    }

    func onChanged(value: DragGesture.Value) {
        print(value.location.x)
    }

    func onEnded(value: DragGesture.Value) {

    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
