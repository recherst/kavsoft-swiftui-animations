//
//  ImageViewModel.swift
//  SignalImagePicker
//
//  Created by recherst on 2021/8/26.
//

import SwiftUI
import Photos
import AVKit

class ImagePickerViewModel: NSObject, ObservableObject, PHPhotoLibraryChangeObserver {

    @Published var showImagePicker = false

    @Published var libraryStatus = LibraryStatus.denied

    // List of fetched photos
    @Published var fetchedPhotos: [Asset] = []
    // To get updates
    @Published var allPhotos: PHFetchResult<PHAsset>!

    // Preview
    @Published var showPreview = false
    @Published var selectedImagePreview: UIImage!
    @Published var selectedVideoPreview: AVAsset!

    func openImagePicker() {
        // Close keyboard if opened
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        // fetch image when it needed
        if fetchedPhotos.isEmpty {
            fetchPhotos()
        }

        withAnimation { showImagePicker.toggle() }
    }

    func Setup() {
        // Repuest permission
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            DispatchQueue.main.async {
                switch status {
                case .denied:
                    self.libraryStatus = .denied
                case .authorized:
                    self.libraryStatus = .approved
                case .limited:
                    self.libraryStatus = .limited
                default:
                    self.libraryStatus = .denied
                }
            }
        }

        // Register observer
        PHPhotoLibrary.shared().register(self)
    }

    // Listen to changes
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let _ = allPhotos else { return }

        if let updates = changeInstance.changeDetails(for: allPhotos) {
            // Get updated list
            let updatedPhotos = updates.fetchResultAfterChanges

            // There is bug in it
            // It is not updating the inserted or removed items
//            print(updates.insertedObjects.count)
//            print(updates.removedObjects.count)
            // So we're going to verify all and append only No in the list
            // to avoid of reloading all and ram usage

            updatedPhotos.enumerateObjects { asset, index, _ in
                if !self.allPhotos.contains(asset) {
                    // If its not there
                    // get image and append it to array
                    self.getImage(from: asset, size: CGSize(width: 150, height: 150)) { image in
                        DispatchQueue.main.async {
                            self.fetchedPhotos.append(Asset(asset: asset, image: image))
                        }
                    }
                }
            }

            // To remove if image is removed
            allPhotos.enumerateObjects { asset, index, _ in
                if !updatedPhotos.contains(asset) {
                    // Remove it
                    DispatchQueue.main.async {
                        self.fetchedPhotos.removeAll { $0.asset == asset }
                    }
                }
            }

            DispatchQueue.main.async {
                self.allPhotos = updatedPhotos
            }

        }

    }

    func fetchPhotos() {
        // Fetching all photos
        let options = PHFetchOptions()
        options.sortDescriptors = [
            // Latest to old
            NSSortDescriptor(key: "creationDate", ascending: false)

        ]
        options.includeHiddenAssets = false

        let fetchedResults = PHAsset.fetchAssets(with: options)

        allPhotos = fetchedResults

        fetchedResults.enumerateObjects { asset, index, _ in
            // Get image from asset
            self.getImage(from: asset, size: CGSize(width: 150, height: 150)) { image in
                // Append it to array
                // Why we store asset?
                // To get full image for sending
                self.fetchedPhotos.append(Asset(asset: asset, image: image))
            }
        }
    }

    // Use completion handlers to recive objects
    func getImage(from asset: PHAsset, size: CGSize, completion: @escaping (UIImage) -> ()) {

        // To cache image in memory
        let imageManager = PHCachingImageManager()

        imageManager.allowsCachingHighQualityImages = true

        // Your own properties for images
        let imageOptions = PHImageRequestOptions()
        imageOptions.deliveryMode = .highQualityFormat
        imageOptions.isSynchronous = false

        // To reduce Ram uage just getting thumbnail size of image
        let size = CGSize(width: 150, height: 150)

        imageManager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: imageOptions) { image, _ in
            guard let resizedImage = image else { return }
            completion(resizedImage)
        }
    }

    // Open image or video
    func extractPreviewData(asset: PHAsset) {
        let manager = PHCachingImageManager()
        if asset.mediaType == .image {
            // Extract image
            getImage(from: asset, size: PHImageManagerMaximumSize) { image in
                DispatchQueue.main.async {
                    self.selectedImagePreview = image
                }
            }
        }

        if asset.mediaType == .video {
            // Extract video
            let videoManager = PHVideoRequestOptions()
            videoManager.deliveryMode = .highQualityFormat

            manager.requestAVAsset(forVideo: asset, options: videoManager) { videoAsset, _, _ in
                guard let videoURL = videoAsset else { return }
                DispatchQueue.main.async {
                    self.selectedVideoPreview = videoURL
                }
            }
        }
    }

}

