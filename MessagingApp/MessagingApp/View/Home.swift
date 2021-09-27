//
//  Home.swift
//  MessagingApp
//
//  Created by recherst on 2021/9/28.
//

import SwiftUI

struct Home: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var selectedTab = "Chats"

    @Namespace var aniamtion
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ZStack {
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "camera")
                                .font(.system(size: 22))
                        })

                        Spacer(minLength: 0)

                        Button(action: {}, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 22))
                        })
                    }

                    Text("ModyChat")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding()
                .padding(.top, edges!.top)
                .foregroundColor(.white)


                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { title in
                        TabButton(selectedTab: $selectedTab, title: title, animation: aniamtion)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.08))
                .cornerRadius(15)
                .padding(.vertical)
            }
            .padding(.bottom)
            .background(Color("top"))
            .clipShape(CustomCorner(corner: .bottomLeft, size: 65))

            ZStack {
                Color("top")

                Color("bg")
                    .clipShape(CustomCorner(corner: .topRight, size: 65))

                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 20) {
                        HStack {
                            Text("All Chats")
                                .font(.title2)
                                .fontWeight(.bold)

                            Spacer(minLength: 0)

                            Button(action: {}, label: {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.system(size: 22))
                                    .foregroundColor(.primary)
                            })
                        }
                        .padding()

                        ForEach(data, id: \.groupName) { gData in
                            // Group name
                            HStack {
                                Text(gData.groupName)
                                    .font(.caption)
                                    .foregroundColor(.gray)

                                Spacer(minLength: 0)
                            }
                            .padding(.horizontal)

                            // Group Data
                            ForEach(gData.groupData) { chatData in
                                // Chat view
                                ChatView(chatData: chatData)
                            }
                        }
                    }
                    .padding(.vertical)
                })
                //.clipShape(CustomCorner(corner: .topRight, size: 65))
                // Its cutting off inside view maybe its a bug
            }
        }
        .background(Color("bg").ignoresSafeArea())
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var tabs = ["Chats", "Status", "Calls"]
