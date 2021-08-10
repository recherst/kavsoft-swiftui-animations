//
//  Home.swift
//  DownloadTask
//
//  Created by recherst on 2021/8/10.
//

import SwiftUI

struct Home: View {
    @StateObject var downloadModel = DownloadTaskModel()
    @State var urlText = ""
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                TextField("URL", text: $urlText)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)

                // Download Button
                Button(action: {
                    downloadModel.startDownload(urlString: urlText)
                }, label: {
                    Text("Download URL")
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
                .padding(.top)
            }
            .padding()
            .navigationTitle("Download Task")
        }
        // always light mode
        .preferredColorScheme(.light)
        .alert(isPresented: $downloadModel.showAlert, content: {
            Alert(title: Text("Message"), message: Text(downloadModel.alertMsg), dismissButton: .destructive(Text("OK"), action: {
                downloadModel.showDownloadProgress = false
            }))
        })
        .overlay(
            ZStack {
                if downloadModel.showDownloadProgress {
                    DownloadProgressView(progress: $downloadModel.downloadProgress)
                        .environmentObject(downloadModel)
                }
            }
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Sample URL
// For testing
let url = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
