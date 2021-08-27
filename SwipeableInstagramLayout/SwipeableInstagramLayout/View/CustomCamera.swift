//
//  CustomCamera.swift
//  SwipeableInstagramLayout
//
//  Created by recherst on 2021/8/27.
//

import SwiftUI
import AVFoundation

struct CameraView: View {

    @StateObject var camera = CameraModel()
    @Binding var offset: CGFloat

    var body: some View {
        ZStack {
            // Go to Be Camera preview
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)

            VStack {
                Spacer()

                HStack {
                    // If taken showing save and again take button...
                    if camera.isTaken {

                    } else {
                        Button(action: camera.takePic, label: {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 65, height: 65)

                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 75, height: 75)
                            }
                        })
                    }
                }
                .frame(height: 75)
                .padding(.bottom, edges?.bottom ?? 15)
            }
        }
        .onAppear(perform: {
            camera.Check()
        })
        .alert(isPresented: $camera.alert) {
            Alert(title: Text("Please Enable Camera Access"))
        }
        .onChange(of: offset, perform: { value in
            if value == 0 && !camera.session.isRunning {
                camera.session.startRunning()
            } else {
                if camera.session.isRunning && offset >= rect.width {
                    camera.session.stopRunning()
                }
            }
        })
    }
}


// Set view for preview
struct CameraPreview: UIViewRepresentable {

    @ObservedObject var camera: CameraModel

    func makeUIView(context: Context) ->  UIView {

        let view = UIView(frame: UIScreen.main.bounds)

        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame

        // Your own properties
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        // Only turning camera on when offset is 0
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {

    }
}
