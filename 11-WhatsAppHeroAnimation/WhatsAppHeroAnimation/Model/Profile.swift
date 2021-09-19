//
//  Profile.swift
//  WhatsAppHeroAnimation
//
//  Created by recherst on 2021/8/12.
//

import Foundation

// Profile model and sample recents maps list
struct Profile:Identifiable {
    var id = UUID().uuidString
    var userName: String
    var profile: String
    var lastMsg: String
    var time: String
}

let recents = [
    Profile(userName: "iJustine", profile: "pic1", lastMsg: "Hi Kavsoft !!!", time: "10:25"),
    Profile(userName: "Kaviya", profile: "pic2", lastMsg: "What's Up 😙😙😙", time: "11:25"),
    Profile(userName: "Emily", profile: "pic3", lastMsg: "Need to Record Docmentation", time: "10:25"),
    Profile(userName: "Julie", profile: "pic4", lastMsg: "Simply Sitting", time: "10:25"),
    Profile(userName: "Steve", profile: "pic5", lastMsg: "Lying :(((((", time: "10:25"),
    Profile(userName: "Jenna", profile: "pic6", lastMsg: "No March Event😢", time: "06:25")
]
