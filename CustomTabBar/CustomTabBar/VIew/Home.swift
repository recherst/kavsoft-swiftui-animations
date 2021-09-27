//
//  Home.swift
//  CustomTabBar
//
//  Created by recherst on 2021/9/27.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "house.fill"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Namespace var animation

    @StateObject var modelData = ViewModel()

    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { _ in
                ZStack {
                    // Tabs
//                    NavigationView {
                        ScrollView {
                            ForEach(1...25, id: \.self) { i in
                                NavigationLink(
                                    destination: Text("Home Data \(i)"),
                                    label: {
                                        VStack(alignment: .leading) {
                                            Text("Home Data \(i)")
                                                .padding()
                                                .foregroundColor(.black)
                                            Divider()
                                        }
                                    })
                            }
                            .padding(.bottom)
                        }
                        .navigationBarHidden(true)
//                    }
                    .opacity(selectedTab == "house.fill" ? 1 : 0)

                    Text("Restaurants")
                        .opacity(selectedTab == "location.circle.fill" ? 1 : 0)

                    Text("Orders")
                        .opacity(selectedTab == "list.dash" ? 1 : 0)

                    Text("Rewards")
                        .opacity(selectedTab == "gearshape" ? 1 : 0)
                }
            }
            .onChange(of: selectedTab, perform: { value in
                switch selectedTab {
                case "location.circle.fill":
                    if !modelData.isRestaurantLoad {
                        modelData.loadRestaurant()
                    }
                case "list.dash":
                    if !modelData.isOrderLoad {
                        modelData.loadOrders()
                    }
                case "gearshape":
                    if !modelData.isRewardLoad {
                        modelData.loadReward()
                    }
                default: ()
                }
            })

            // TabView
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    TabButton(title: tab, selectedTab: $selectedTab, animation: animation)

                    if tab != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 30)
            // For iPhone like 8 and SE
            .padding(.bottom, edges!.bottom == 0 ? 15 : edges!.bottom)
            .background(Color.white)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(
            Color.black
                .opacity(0.06)
                .ignoresSafeArea()
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Both title image name are same
var tabs = ["house.fill", "location.circle.fill", "list.dash", "gearshape"]

