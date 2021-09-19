//
//  DownloadProgressView.swift
//  DownloadTask
//
//  Created by recherst on 2021/8/10.
//

import SwiftUI

struct DownloadProgressView: View {
    @Binding var progress: CGFloat
    @EnvironmentObject var downloadModel: DownloadTaskModel
    var body: some View {
        ZStack {
            Color.primary
                .opacity(0.25)
                .ignoresSafeArea()

            VStack(spacing: 15) {
                ZStack {
                    // Custom circle progress view
                    Circle()
                        .fill(Color.gray.opacity(0.3))

                    ProgressShape(progress: progress)
                        .fill(Color.gray.opacity(0.4))
                        .rotationEffect(Angle(degrees: -90))
                }
                .frame(width: 70, height: 70)

                // Cancel button
                Button(action: downloadModel.cacelTask, label: {
                    Text("Cancel")
                        .fontWeight(.semibold)
                })
                .padding(.top)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 50)
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}

struct DownloadProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadProgressView(progress: .constant(0.5))
    }
}

// Custom progress shape
struct ProgressShape: Shape {

    var progress: CGFloat

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))

            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 35, startAngle: .zero, endAngle: Angle(degrees: Double(progress * 360)), clockwise: false)
        }
    }
}
