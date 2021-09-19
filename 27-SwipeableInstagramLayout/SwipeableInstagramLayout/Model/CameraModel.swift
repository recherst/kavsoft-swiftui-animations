//
//  CameraModel.swift
//  SwipeableInstagramLayout
//
//  Created by recherst on 2021/8/27.
//

import SwiftUI
import AVFoundation

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {

    @Published var isTaken = false

    @Published var session = AVCaptureSession()

    @Published var alert = false

    // since were going to read pic data
    @Published var output = AVCapturePhotoOutput()

    // Preview
    @Published var preview : AVCaptureVideoPreviewLayer!

    // Pic Data
    @Published var isSaved = false
    @Published var picData = Data(count: 0)

    func Check() {
        // First checking camera has got permission
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
            // Set Up Session
        case .notDetermined:
            // Retust for permission
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status {
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
        default:
            return
        }
    }

    func setUp() {
        // Setting up camera
        do {
            // Setting configs
            self.session.beginConfiguration()
            // Change for your own
            guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else { return }

            let input = try AVCaptureDeviceInput(device: device)

            // Check and adding to session
            if session.canAddInput(input) {
                session.addInput(input)
            }

            // Same for output
            if session.canAddOutput(self.output) {
                session.addOutput(self.output)
            }
            session.commitConfiguration()
        } catch {
            print(error.localizedDescription)
        }
    }

    // Take and retake functions
    func takePic() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)

        DispatchQueue.global(qos: .background).async {
            self.session.stopRunning()
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
            }
        }
    }

    func reTake() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
                // Clear
                self.isSaved = false
                self.picData = Data(count: 0)
            }
        }
    }

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil { return }

        print("pic taken...")

        guard let imageData = photo.fileDataRepresentation() else { return }
        picData = imageData
    }

//    func savePic() {
//
//        guard let image = UIImage(data: self.picData) else{return}
//
//        // saving Image
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//
//        self.isSaved = true
//
//        print("saved Successfully....")
//    }
}
