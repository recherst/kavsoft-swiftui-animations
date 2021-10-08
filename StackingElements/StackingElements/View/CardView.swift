//
//  CardView.swift
//  StackingElements
//
//  Created by recherst on 2021/10/8.
//

import SwiftUI

struct CardView: View {
    var tool: Tool
    var reader: GeometryProxy
    @Binding var swiped: Int
    @Binding var show: Bool
    @Binding var selected: Tool
    var name: Namespace.ID

    var body: some View {
        VStack {
            Spacer(minLength: 0)

            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                VStack {
                    Image(tool.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: tool.image, in: name)
                        .padding(.top)
                        .padding(.horizontal, 25)

                    HStack {
                        VStack(alignment: .leading, spacing: 12, content: {
                            Text(tool.name)
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.black)

                            Text("Design tool")
                                .font(.system(size: 20))
                                .foregroundColor(.black)

                            Button(action: {
                                withAnimation(.spring()) {
                                    selected = tool
                                    show.toggle()
                                }
                            }, label: {
                                Text("Know More >")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("orange"))
                            })
                            .padding(.top)
                        })

                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 15)
                    .padding(.top, 25)
                }


                HStack {
                    Text("#")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray.opacity(0.6))

                    Text("\(tool.place)")
                        .font(.system(size: 120))
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray.opacity(0.6))
                }
                .offset(x: -15, y: 25)
            })
            .frame(height: reader.frame(in: .global).height - 120)
            .padding(.vertical, 10)
            .background(Color.white)
            .cornerRadius(25)
            .padding(.horizontal, 30 + (CGFloat(tool.id - swiped) * 10))
            .offset(y:tool.id - swiped <= 2 ? CGFloat(tool.id - swiped) * 25 : 50)
            .shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 5)

            Spacer(minLength: 0)
        }
        .contentShape(Rectangle())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
