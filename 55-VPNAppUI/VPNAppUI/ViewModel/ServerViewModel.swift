//
//  ServerViewModel.swift
//  VPNAppUI
//
//  Created by recherst on 2021/9/16.
//

import SwiftUI

class ServerViewModel: ObservableObject {
    @Published var servers = [
        Server(name: "United States", flag: "us"),
        Server(name: "India", flag: "in"),
        Server(name: "United Kingdom", flag: "uk"),
        Server(name: "France", flag: "fr"),
        Server(name: "Germany", flag: "ge"),
        Server(name: "Singapore", flag: "si"),
    ]

    @Published var isConnected = false
    @Published var showSheet = false

    @Published var currentServer = Server(name: "United States", flag: "us")
}
