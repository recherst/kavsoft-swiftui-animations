//
//  TooManyTabs.swift
//  TestPadding
//
//  Created by RecherJ on 2021/7/14.
//

import SwiftUI

struct TooManyTabs: View {
    var body: some View {
        TabView {
            Text("Call Screen")
                .tabItem {
                    Image(systemName: "phone")
                    Text("Call")
                }
            Text("Outgoing Phone Calls Screen")
                .tabItem {
                    Image(systemName: "phone.arrow.up.right")
                    Text("Outgoing")
                }
            Text("Incoming Phone Calls Screen")
                .tabItem {
                    Image(systemName: "phone.arrow.down.left")
                    Text("Incoming")
                }
            Text("Phone Book Screen")
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
            Text("New Phone Number")
                .tabItem {
                    Image(systemName: "phone.badge.plus")
                    Text("New")
                }
        }
    }
}

// When there are too many tabs to fit for the device, the More button is created where
// you can find the rest of the tabs listed out.

struct TooManyTabs_Previews: PreviewProvider {
    static var previews: some View {
        TooManyTabs()
    }
}
