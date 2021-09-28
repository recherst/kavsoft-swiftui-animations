//
//  Home.swift
//  AudioVisualizer
//
//  Created by recherst on 2021/9/28.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))

    // Timer to find current time of audio

    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    // Details of song
    @StateObject var album = AlbumData()

    @State var animatedValue: CGFloat = 55

    @State var maxWidth = UIScreen.main.bounds.width / 2.2

    @State var time: Float = 0

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text(album.title)
                        .fontWeight(.semibold)

                    HStack(spacing: 10) {
                        Text(album.artist)
                            .font(.caption)

                        Text(album.type)
                            .font(.caption)
                    }
                })

                Spacer(minLength: 0)

                Button(action: {}, label: {
                    Image(systemName: "suit.heart.fill")
                        .foregroundColor(.red)
                        .frame(width: 45, height: 45)
                        .background(Color.white)
                        .clipShape(Circle())
                })

                Button(action: {}, label: {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.black)
                        .frame(width: 45, height: 45)
                        .background(Color.white)
                        .clipShape(Circle())
                })
                .padding(.leading, 10)
            }
            .padding()

            Spacer(minLength: 0)

            if album.artwork.count != 0 {
                Image(uiImage: UIImage(data: album.artwork)!)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(15)
            }

            ZStack {
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.05))

                    Circle()
                        .fill(Color.white.opacity(0.08))
                        .frame(width: animatedValue / 2, height: animatedValue / 2)
                }
                .frame(width: animatedValue, height: animatedValue)

                Button(action: play, label: {
                    Image(systemName: album.isPlaying ? "pause.fill" : "play.fill")
                        .foregroundColor(.black)
                        .frame(width: 55, height: 55)
                        .background(Color.white)
                        .clipShape(Circle())
                })
            }
            .frame(width: maxWidth, height: maxWidth)
            .padding(.top, 30)

            // Audio Tracking
            Slider(value: Binding(get: { time }, set: { newValue in
                time = newValue

                // Update player
                audioPlayer.currentTime = Double(time) * audioPlayer.duration
                audioPlayer.play()
            }))
            .padding()

            Spacer(minLength: 0)
        }
        .onReceive(timer, perform: { _ in
            if audioPlayer.isPlaying {
                audioPlayer.updateMeters()
                album.isPlaying = true
                // Update slider
                time = Float(audioPlayer.currentTime / audioPlayer.duration)
                // Get animation
                startAnimation()
            } else {
                album.isPlaying = false
            }
        })
        .onAppear(perform: getAudioData)
    }

    func play() {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        } else {
            audioPlayer.play()
        }
    }

    func getAudioData() {
        audioPlayer.isMeteringEnabled = true

        // Extract audio data
        let asset = AVAsset(url: audioPlayer.url!)
        asset.metadata.forEach { meta in
            switch meta.commonKey?.rawValue {
            case "artwork": album.artwork = meta.value == nil ? UIImage(named: "any sample pic...")!.pngData()! : meta.value as! Data

            case "artist": album.artist = meta.value == nil ? "" : meta.value as! String

            case "type": album.type = meta.value == nil ? "" : meta.value as! String

            case "title": album.title = meta.value == nil ? "" : meta.value as! String
            default:()
            }
        }
    }

    func startAnimation() {
        // Get levels
        var power: Float = 0
        for i in 0..<audioPlayer.numberOfChannels {
            power += audioPlayer.averagePower(forChannel: i)
        }

        // Calculate to get postive number
        let value = max(0, power + 55)
        // You can also use if st to find postive number

        let animated = CGFloat(value) * (maxWidth / 55)

        withAnimation(.linear(duration: 0.01)) {
            self.animatedValue = animated + 55
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


let url = Bundle.main.path(forResource: "audio", ofType: "mp3")
