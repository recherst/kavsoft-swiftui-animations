//
//  DownloadtaskModel.swift
//  DownloadTask
//
//  Created by recherst on 2021/8/10.
//

import Foundation
import UIKit
import SwiftUI

class DownloadTaskModel: NSObject, ObservableObject, URLSessionDownloadDelegate, UIDocumentInteractionControllerDelegate {
    
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

        // Presenting downloading the same file again
        let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        if FileManager.default.fileExists(atPath: directoryPath.appendingPathComponent(validURL.lastPathComponent).path) {
            print("yes file found")

            let controller = UIDocumentInteractionController(url: directoryPath.appendingPathComponent(validURL.lastPathComponent))
            controller.delegate = self
            controller.presentPreview(animated: true)
        } else {
            print("no file found")
            // Valid URL
            downloadProgress = 0
            withAnimation { self.showDownloadProgress = true }

            // Download task
            // Since we're going to get the progress as well as location of file so we're using delegate
            let seesion = URLSession(configuration: .default, delegate: self, delegateQueue: nil)

            downloadTaskSession = seesion.downloadTask(with: validURL)
            downloadTaskSession.resume()
        }
    }

    func reportError(error: String) {
        alertMsg = error
        showAlert.toggle()
    }

    // Implementing URLSession Functions
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        // Since it will download it as temporay data
        // so we're going to save it in app document directory and showing it in document controller
        guard let url = downloadTask.originalRequest?.url else {
            DispatchQueue.main.async {
                self.reportError(error: "Something went wrong please try again later")
            }
            return
        }

        // Diretory path
        let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

        // Creating one for storing file
        // Destination URL
        // Get the mp4
        let destinationURL = directoryPath.appendingPathComponent(url.lastPathComponent)

        // if already file is there removing that
        try? FileManager.default.removeItem(at: destinationURL)
        do {
            // Copying temp file to directory
            try FileManager.default.copyItem(at: location, to: destinationURL)
            // If success
            print("success")
            // Closing progress view
            DispatchQueue.main.async {
                withAnimation { self.showDownloadProgress = false }

                // presenting the file with the help of document interaction controller from UIKit
                let controller = UIDocumentInteractionController(url: destinationURL)

                // it needs a delegate
                controller.delegate = self
                controller.presentPreview(animated: true)
            }
        } catch {
            DispatchQueue.main.async {
                self.reportError(error: "Please try again later!!!")
            }
        }
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

    // error
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        DispatchQueue.main.async {
            if let error = error {
                withAnimation {
                    self.showDownloadProgress = true
                }
                self.reportError(error: error.localizedDescription)
                return
            }
        }
    }

    // Cancel task
    func cacelTask() {
        if let task = downloadTaskSession, task.state == .running {
            // Cancel
            downloadTaskSession.cancel()
            // Closing view
            withAnimation { self.showDownloadProgress = false }
        }
    }

    // Sub functions for presenting view
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return UIApplication.shared.windows.first!.rootViewController!
    }
}
