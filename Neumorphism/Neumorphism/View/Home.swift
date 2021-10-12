//
//  Home.swift
//  Neumorphism
//
//  Created by recherst on 2021/10/13.
//

import SwiftUI

struct Home: View {
    @State var value: CGFloat = 50
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color("Color"))
                            .clipShape(Circle())
                            // Add neuromorphic effect
                            .shadow(color: Color("Color1").opacity(0.6), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.white, radius: 5, x: -5, y: -5)
                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color("Color"))
                            .clipShape(Circle())
                            .shadow(color: Color("Color1").opacity(0.6), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.white, radius: 5, x: -5, y: -5)
                    })
                }

                Text("Now Playing")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }

            // Track image
            Image("track")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .padding(.all, 8)
                .background(Color("Color").opacity(0.6))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.35), radius: 8, x: 8, y: 8)
                .shadow(color: Color.white, radius: 10, x: -10, y: -10)
                .padding(.top, 35)

            // Music details
            Text("Lose it")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top, 25)

            Text("Flume ft Vic monica")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 8)

            // Timings
            HStack {
                Text("1:15")
                    .font(.caption2)
                    .foregroundColor(.gray)

                Spacer()

                Text("4:02")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding(.top, 25)

            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {

                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 6)
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                    Capsule()
                        .fill(Color("Color1").opacity(0.6))
                        .frame(width: value, height: 6)

                    // Drag button
                    Circle()
                        .fill(Color("Color1").opacity(0.7))
                        .frame(width: 10, height: 10)
                        .padding(.all, 10)
                        .background(Color("Color"))
                        .clipShape(Circle())
                        .shadow(color: Color("Color1").opacity(0.6), radius: 10, x: 4, y: 2)
                }
            })
            // Add gesture
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        if value.location.x <= UIScreen.main.bounds.width - 30 && value.location.x >= 0 {
                            self.value = value.location.x
                        }
                    })
            )
            .padding(.top, 8)

            // Add playback buttons
            HStack(spacing: 20) {
                Button(action: {}, label: {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.all, 25)
                        .background(Color("Color"))
                        .clipShape(Circle())
                        .shadow(color: Color("Color1").opacity(0.6), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.white, radius: 5, x: -5, y: -5)
                })

                Button(action: {}, label: {
                    Image(systemName: "pause.fill")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.all, 25)
                        .background(Color("Color1"))
                        .clipShape(Circle())
                        .shadow(color: Color("Color1").opacity(0.6), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.white, radius: 5, x: -5, y: -5)
                })

                Button(action: {}, label: {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.all, 25)
                        .background(Color("Color"))
                        .clipShape(Circle())
                        .shadow(color: Color("Color1").opacity(0.6), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.white, radius: 5, x: -5, y: -5)
                })
            }
            .padding(.top, 25)


            Spacer()
        }
        .padding(.all)
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
