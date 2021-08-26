//
//  Home.swift
//  SignalImagePicker
//
//  Created by recherst on 2021/8/26.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var message = ""
    @StateObject var imagePicker = ImagePickerViewModel()
    
    var body: some View {
        NavigationView {
            // Sample signal chat view
            VStack {
                ScrollView {

                }

                VStack {
                    HStack(spacing: 15) {
                        Button(action: imagePicker.openImagePicker, label: {
                            Image(systemName: imagePicker.showImagePicker ? "xmark" : "plus")
                                .font(.title2)
                                .foregroundColor(.gray)
                        })

                        TextField("New Message", text: $message, onEditingChanged: { opened in
                            if opened && imagePicker.showImagePicker {
                                // Close picker
                                withAnimation {
                                    imagePicker.showImagePicker.toggle()
                                }
                            }
                        })
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())

                        Button(action: {}, label: {
                            Image(systemName: "camera")
                                .font(.title2)
                                .foregroundColor(.gray)
                        })

                        Button(action: {}, label: {
                            Image(systemName: "mic")
                                .font(.title2)
                                .foregroundColor(.gray)
                        })
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 4)

                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 15) {
                            // Images
                            ForEach(imagePicker.fetchedPhotos) { photo in
                                ThumbnailView(photo: photo)
                                    .onTapGesture {
                                        imagePicker.extractPreviewData(asset: photo.asset)
                                        imagePicker.showPreview.toggle()
                                    }
                            }
                            // More or give access button
                            if imagePicker.libraryStatus == .denied || imagePicker.libraryStatus == .limited {
                                VStack(spacing: 10) {
                                    Text(imagePicker.libraryStatus == .denied ? "Allow Access For Photos" : "Select More Photos")
                                        .foregroundColor(.gray)

                                    Button(action: {
                                        // Go to settings
                                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                                    }, label: {
                                        Text(imagePicker.libraryStatus == .denied ? "Allow Access" : "Select More")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal)
                                            .background(Color.blue)
                                            .cornerRadius(5)
                                    })
                                }
                                .frame(width: 150)
                            }
                        }
                        .padding()
                    })
                    // Showing when button clicked
                    .frame(height: imagePicker.showImagePicker ? 200 : 0)
                    .background(
                        Color.primary.opacity(0.04)
                            .ignoresSafeArea(.all, edges: .bottom)
                    )
                    .opacity(imagePicker.showImagePicker ? 1 : 0)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Back button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}, label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)

                    })
                }

                // Profile

                ToolbarItem(id: "PROFILE", placement: .navigationBarLeading, showsByDefault: true) {
                    HStack(spacing: 8) {
                        // Use your image or profile image here
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("K")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )

                        Text("Kavsoft")
                            .fontWeight(.semibold)

                        Image(systemName: "person.circle")
                            .font(.caption)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "camera")
                            .font(.title2)

                    })
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "phone")
                            .font(.title2)

                    })
                }
            }
        }
        // Colors will not work on navigation bar
        // But use accent color to change
        .accentColor(.primary)
        .onAppear(perform: imagePicker.Setup)
        .sheet(isPresented: $imagePicker.showPreview, onDismiss: {
            // Clear content
            imagePicker.selectedVideoPreview = nil
            imagePicker.selectedImagePreview = nil
        }, content: {
            PreviewView()
                .environmentObject(imagePicker)
        })
    }
}

// Preview view
struct PreviewView: View {
    @EnvironmentObject var imagePicker: ImagePickerViewModel
    var body: some View {
        // For top button
        NavigationView {
            ZStack {
                if imagePicker.selectedVideoPreview != nil {
                    VideoPlayer(player: AVPlayer(playerItem: AVPlayerItem(asset: imagePicker.selectedVideoPreview)))
                }

                if imagePicker.selectedImagePreview != nil {
                    Image(uiImage: imagePicker.selectedImagePreview)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Text("Send")
                    })
                }
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct ThumbnailView: View {
    var photo: Asset
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            Image(uiImage: photo.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(10)

            // If its video
            // Display video icon
            if photo.asset.mediaType == .video {
                Image(systemName: "video.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(8)
            }
        })
    }
}
