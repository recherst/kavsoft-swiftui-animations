//
//  DownloadtaskModel.swift
//  DownloadTask
//
//  Created by recherst on 2021/8/10.
//

import Foundation
import UIKit
import SwiftUI

class DownloadTaskModel: NSObject, ObservableObject, URLSessionDownloadDelegate {
    
    @Published var downloadURL: URL!

    // Alert
    @Published var alertMsg = ""
    @Published var showAlert = false

    // Saving download task reference for cancelling
    @Published var downloadTaskSession: URLSessionDownloadTask!

    // Progress
    @Published var downloadProgress: CGFloat = 0

    // Show progress view
    @Published var showDownloadProgress = false


    // Download function
    func startDownload(urlString: String) {
        // Checking for valid URL
        guard let validURL = URL(string: urlString) else {
            reportError(error: "Invalid URL!!!")
            return
        }
        // Valid URL
        withAnimation { showDownloadProgress = true }

        // Download task
        // Since we're going to get the progress as well as location of file so we're using delegate
        let seesion = URLSession(configuration: .default, delegate: self, delegateQueue: nil)

        downloadTaskSession = seesion.downloadTask(with: validURL)
        downloadTaskSession.resume()
        
    }

    func reportError(error: String) {
        alertMsg = error
        showAlert.toggle()
    }

    // Implementing URLSession Functions
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(location)
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // Get progress
        let progress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        // since url session will be running in BG thread
        // so UI updates will be done on main threads
        DispatchQueue.main.async {
            self.downloadProgress = progress
        }
    }

    // Cancel task
    func cacelTask() {
        
    }
}
