//
//  Home.swift
//  BillSplitApp
//
//  Created by recherst on 2021/9/8.
//

import SwiftUI

struct Home: View {
    // Total Amount
    @State var bill = 750
    var players = [
        Player(image: "animoji2", name: "Andy", bgColor: Color("animojiColor2")),
        Player(image: "animoji1", name: "Cody", bgColor: Color("animojiColor1")),
        Player(image: "animoji3", name: "Steve", bgColor: Color("animojiColor3")),
    ]

    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(Color("card"))
                        .padding()
                        .background(Color.black.opacity(0.25))
                        .cornerRadius(15)
                })
                Spacer()
            }
            .padding()

            // Bill card view
            VStack(spacing: 15) {
                Button(action: {}, label: {
                    Text("Recipt")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color("bg"))
                        .cornerRadius(12)
                })

                // Dotted lines
                Line()
                    .stroke(Color.black, style: StrokeStyle(lineWidth: 1, lineCap: .butt, lineJoin: .miter, dash: [10]))
                    .frame(height: 1)
                    .padding(.horizontal)
                    .padding(.top, 10)

                HStack {
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Title")
                            .font(.caption)
                        Text("Team Dinner")
                            .font(.title2)
                            .fontWeight(.heavy)
                    })
                    .foregroundColor(Color("bg"))
                    .frame(maxWidth: .infinity)

                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Total Bill")
                            .font(.caption)
                        Text("\(bill)")
                            .font(.title2)
                            .fontWeight(.heavy)
                    })
                    .foregroundColor(Color("bg"))
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                }

                // Animoji view
                VStack {
                    HStack(spacing: -20) {
                        ForEach(players) { player in
                            Image(player.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                                .padding(8)
                                .background(player.bgColor)
                                .clipShape(Circle())
                        }
                    }

                    Text("Spiliting With")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("bg"))
                .cornerRadius(25)

            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                Color("card")
                    .clipShape(BillShape())
                    .cornerRadius(25)
            )
            .padding(.horizontal)


            Spacer()
        }
        .background(Color("bg").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Line shape
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct BillShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))

            path.move(to: CGPoint(x: 0, y: 80))
            path.addArc(
                center: CGPoint(x: 0, y: 80),
                radius: 20,
                startAngle: .init(degrees: -90),
                endAngle: .init(degrees: 90),
                clockwise: false
            )

            path.move(to: CGPoint(x: rect.width, y: 80))
            path.addArc(
                center: CGPoint(x: rect.width, y: 80),
                radius: 20,
                startAngle: .init(degrees: 90),
                endAngle: .init(degrees: -90),
                clockwise: false
            )
        }
    }
}
