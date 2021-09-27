//
//  Chat.swift
//  MessagingApp
//
//  Created by recherst on 2021/9/28.
//

import SwiftUI

struct Chat: Identifiable {
    var id = UUID().uuidString
    var name: String
    var image: String
    var msg: String
    var time: String
}

// We're going to do custom grouping of views
struct HomeData {
    var groupName: String
    var groupData: [Chat]
}

var friendChat: [Chat] = [
    Chat(name: "iJustine", image: "p0", msg: "Hey EveryOne !!!", time: "02:45"),
    Chat(name: "Kavsoft", image: "p1", msg: "Learn - Develop - Deploy", time: "03:45"),
    Chat(name: "SwiftUI", image: "p2", msg: "New Framework For iOS", time: "04:55"),
    Chat(name: "Bill Gates", image: "p3", msg: "Founder Of Microsoft", time: "06:25"),
    Chat(name: "Tim Cook", image: "p4", msg: "Apple lnc CEO", time: "07:19"),
    Chat(name: "Jeff", image: "p5", msg: "I Don't Know How To Spend Money", time: "08:22")
]

var GroupChat: [Chat] = [
    Chat(name: "iTeam", image: "p0", msg: "Hey EveryOne !!!", time: "02:45"),
    Chat(name: "Kavsoft - Developers", image: "p1", msg: "Next Video :)))", time: "03:45"),
    Chat(name: "SwiftUI - Community", image: "p2", msg: "New File Importer/Exporter", time: "04:55")
]

var data = [
    // Group 1
    HomeData(groupName: "Friends", groupData: friendChat),
    // Group 2
    HomeData(groupName: "Group Message", groupData: GroupChat)
]
