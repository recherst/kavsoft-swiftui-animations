//
//  Songs.swift
//  SpotifyUI
//
//  Created by recherst on 2021/8/6.
//

import Foundation

// Song model and sample data

struct Song: Identifiable {

    var id = UUID().uuidString
    var albumName: String
    var albumAuthor: String
    var albumCover: String
}

var recentlyPlayed = [
//    Song(albumName: "Let Her Go", albumAuthor: "Passenger", albumCover: "p1"),
    Song(albumName: "Bad Blood", albumAuthor: "Taylor Swift", albumCover: "p2"),
    Song(albumName: "Believer", albumAuthor: "Kurt Hugo Schneider", albumCover: "p3"),
    Song(albumName: "Let Me Love You", albumAuthor: "DJ Snake", albumCover: "p4"),
    Song(albumName: "Shape Of You", albumAuthor: "Ed Sherran", albumCover: "p5")
]

var likeSongs = [
    Song(albumName: "Blank Space", albumAuthor: "Taylor Swift", albumCover: "p6"),
    Song(albumName: "Havana", albumAuthor: "Camila Cabello", albumCover: "p7"),
    Song(albumName: "Red", albumAuthor: "Taylor Swift", albumCover: "p8"),
    Song(albumName: "I Like It", albumAuthor: "J Balvin", albumCover: "p9"),
    Song(albumName: "Lover", albumAuthor: "Taylor Swift", albumCover: "p10"),
    Song(albumName: "7/27 Harmony", albumAuthor: "Camila Cabello", albumCover: "p11"),
    Song(albumName: "Joanne", albumAuthor: "Lady Gaga", albumCover: "p12"),
    Song(albumName: "Roar", albumAuthor: "Katy Perry", albumCover: "p13"),
    Song(albumName: "My Church", albumAuthor: "Maren Morris", albumCover: "p14"),
    Song(albumName: "Part Of Me", albumAuthor: "Katy Perry", albumCover: "p15")
]

var generes = ["Classic", "Hip-Hop", "Electronic", "Chilout", "Dark", "Calm", "Ambient", "Dance"]

