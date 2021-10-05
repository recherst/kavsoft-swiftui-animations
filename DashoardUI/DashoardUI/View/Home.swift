//
//  Home.swift
//  DashoardUI
//
//  Created by recherst on 2021/10/6.
//

import SwiftUI

struct Home: View {
    @State var tab = "USA"
    @Namespace var animation
    @State var subTab = "Today"
    @State var dailySaled = [
        DailySales(day: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, value: 200, show: true),
        DailySales(day: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, value: 710, show: false),
        DailySales(day: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, value: 330, show: false),
        DailySales(day: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, value: 519, show: false),
        DailySales(day: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, value: 150, show: false),
        DailySales(day: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, value: 229, show: false),
        DailySales(day: Date(), value: 669, show: false)
    ]
    var edges = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "filemenu.and.cursorarrow")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                })

                Spacer(minLength: 0)

                Button(action: {}, label: {
                    Image(systemName: "bell")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                })
            }
            .padding()

            HStack {
                Text("Dashboard")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer(minLength: 0)
            }
            .padding()

            HStack(spacing: 0) {
                TabButton(selected: $tab, title: "USA", animation: animation)

                TabButton(selected: $tab, title: "Global", animation: animation)
            }
            .background(Color.white.opacity(0.08))
            .clipShape(Capsule())
            .padding(.horizontal)

            HStack(spacing: 20) {
                ForEach(subTabs, id: \.self) { tab in
                    Button(action: {
                        subTab = tab
                    }, label: {
                        Text(tab)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white.opacity(subTab == tab ? 1 : 0.4))
                    })
                }
            }
            .padding()

            VStack(spacing: 20) {
                HStack(spacing: 15) {
                    SalesView(sale: salesData[0])

                    SalesView(sale: salesData[1])
                }

                HStack(spacing: 15) {
                    SalesView(sale: salesData[2])

                    SalesView(sale: salesData[3])

                    SalesView(sale: salesData[4])
                }
            }
            .padding(.horizontal)

            ZStack {
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], size: 45))
                    .ignoresSafeArea(.all, edges: .bottom)

                VStack {
                    HStack {
                        Text("Daily Sold Units")
                            .font(.title2)
                            .foregroundColor(.black)

                        Spacer(minLength: 0)
                    }
                    .padding()
                    .padding(.top, 10)

                    HStack(spacing: 10) {
                        ForEach(dailySaled.indices, id: \.self) { index in
                            // For toggling show button
                            GraphView(data: dailySaled[index], allData: dailySaled)
                                .onTapGesture {
                                    withAnimation {
                                        // Toggle all other
                                        for i in 0..<dailySaled.count {
                                            dailySaled[i].show = false
                                        }
                                        dailySaled[index].show.toggle()
                                    }
                                }

                            // Sample spacing for spacing effect
                            if dailySaled[index].value != dailySaled.last!.value {
                                Spacer(minLength: 0)
                            }
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, edges!.bottom == 0 ? 15 : 0)
                }
            }
            .padding(.top, 20)
        }
        .background(Color("bg").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


var subTabs = ["Today", "Yesterday", "Last Week"]
