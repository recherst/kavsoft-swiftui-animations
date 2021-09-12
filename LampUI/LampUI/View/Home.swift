//
//  Home.swift
//  LampUI
//
//  Created by recherst on 2021/9/12.
//

import SwiftUI

struct Home: View {
    // Top edge padding
    var top = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    // Circle width
    var width = UIScreen.main.bounds.width / 2
    // Rotate angle
    @State var angle: Double = 0

    @State var on = true

    @State var from: Date = Date()
    @State var to: Date = Date()

    // For smaller device
    @State var isSmall = UIScreen.main.bounds.width < 750

    var body: some View {
        VStack {
            ScrollView(isSmall ? .vertical : .init(), showsIndicators: false, content: {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    Image("lamp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: isSmall ? 150 : nil, height: isSmall ? 150 : nil)

                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.black)
                        })

                        Spacer()

                        Button(action: {}, label: {
                            Image(systemName: "gear")
                                .font(.title2)
                                .foregroundColor(.black)
                        })
                    }
                    .padding()
                    .padding(.top, top)
                }
                .padding(.bottom)

                Text("Intensity")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding()

                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: width, height: width)

                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: width - 45, height: width - 45)
                                // shadows
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
                                // Also rotate
                                .rotationEffect(.init(degrees: angle))

                            Circle()
                                .fill(Color("yellow"))
                                .frame(width: 20, height: 20)
                                // Move view left
                                .offset(x: (width - 100) / 2)
                                .rotationEffect(.init(degrees: angle))
                                // Add gesture
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged(onChanged(value:))

                                )
                                // Rotate to start point
                                .rotationEffect(.init(degrees: -210))
                        }

                        // dots
                        Dots()
                    }

                    HStack {

                        Text("16°C")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)

                        Spacer()

                        Text("28°C")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 30)
                })
                .padding()
                .padding(.top)

                HStack {
                    Spacer()

                    HStack(spacing: 15) {
                        Text("Power Saver")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)

                        Toggle("", isOn: $on)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: Color("yellow")))
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .background(BlurView().cornerRadius(15))
                }
                .padding()

                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Schedule")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)

                    Text("From")
                        .font(.caption)
                        .foregroundColor(.gray)

                    HStack(spacing: 15) {
                        DatePicker("", selection: $from, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            // For black color
                            .accentColor(.black)

                        Text("To")
                            .font(.caption)
                            .foregroundColor(.gray)

                        DatePicker("", selection: $to, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            .accentColor(.black)
                    }
                })
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            })

            ZStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "house")
                            .font(.system(size: 24))
                            .foregroundColor(Color("yellow"))
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "person")
                            .font(.system(size: 24))
                            .foregroundColor(Color("yellow"))
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    })
                }

                Button(action: {}, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .heavy))
                        .foregroundColor(Color("yellow"))
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                })
                // Move view little down
                .offset(y: 10.0)
            }
            .padding(.horizontal)
            .padding(.top, isSmall ? 0 : 25)
            .padding(.bottom, top == 0 ? 15 : 0)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(
            ZStack {
                Color("yellow")

                Color.white
                    .clipShape(CustomShape())
                // rotate view upside down
                    .rotationEffect(.init(degrees: 180))

            }
            .ignoresSafeArea()
        )
    }

    func onChanged(value: DragGesture.Value) {
        let translation = value.location
        let vector = CGVector(dx: translation.x, dy: translation.y)
        // -10 is circle radius since circle size is 20
        // For more info on circle slider, check the video link in description
        let radians = atan2(vector.dy - 10, vector.dx - 10)

        var angle = radians * 180 / .pi
        if angle < 0 {
            angle += 360
        }
        // Limit angle from 0 to 240
        if angle <= 240 {
            self.angle = Double(angle)
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

