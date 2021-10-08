//
//  Detail.swift
//  StackingElements
//
//  Created by recherst on 2021/10/8.
//

import SwiftUI

struct Detail: View {
    var tool: Tool
    @Binding var show: Bool
    var name: Namespace.ID

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12, content: {
                Button(action: {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                })

                Spacer(minLength: 0)

                Image(tool.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .matchedGeometryEffect(id: tool.image, in: name)
            })
            .padding(.leading, 20)
            .padding([.top, .bottom, .trailing])

            // For smaller size phones
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 12, content: {
                            Text(tool.name)
                                .font(.system(size: 45, weight: .bold))
                                .foregroundColor(.black)

                            Text("Design tools")
                                .font(.system(size: 30))
                                .foregroundColor(.black)

                            Text("Free")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding(.top, 10)
                        })

                        Spacer(minLength: 0)

                        HStack {
                            Text("#")
                                .font(.system(size: 60, weight: .bold))

                            Text("\(tool.place)")
                                .font(.system(size: 180, weight: .bold))
                        }
                        .foregroundColor(Color.gray.opacity(0.7))
                    }
                    .padding(.vertical)


                    Text("\(tool.name) is s vector graphics editor and prototyping tool. It is primarily web-based, with additional offline features enabled by desktop applications for macOS and Windows.")
                        .font(.system(size: 22))
                        .foregroundColor(Color.black.opacity(0.7))
                        .multilineTextAlignment(.leading)
                        .padding(.top)

                    HStack(spacing: 15) {
                        Button(action: {}, label: {
                            Text("Website")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 120)
                                .background(Color("orange"))
                                .clipShape(Capsule())
                        })

                        Button(action: {}, label: {
                            Image(systemName: "suit.heart.fill")
                                .font(.title)
                                .foregroundColor(Color("orange"))
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        })
                    }
                    .padding(.top, 25)
                    .padding(.bottom)
                }
                .padding(.horizontal, 20)
            })
        }
        .background(Color.white)
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
