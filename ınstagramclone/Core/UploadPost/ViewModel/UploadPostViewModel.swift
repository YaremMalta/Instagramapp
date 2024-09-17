//
//  UploadPostViewModel.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 2.09.2024.
//
import SwiftUI
import PhotosUI
import Firebase
import FirebaseAuth
import FirebaseStorage

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(fromItem: selectedImage) }
        }
    }
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        // Generate a unique filename for the image
        let imageFileName = UUID().uuidString + ".jpg"
        let imageRef = Storage.storage().reference().child("post_images/\(imageFileName)")
        
        // Upload the image data
        guard let uploadData = uiImage.jpegData(compressionQuality: 0.75) else { return }
        _ = try await imageRef.putDataAsync(uploadData)
        
        // Get the image download URL
        let imageUrl = try await imageRef.downloadURL()
        
        // Create a new post and save it to Firestore
        let postRef = Firestore.firestore().collection("posts").document()
        let post = Post(
            id: postRef.documentID,
            ownerUid: uid,
            caption: caption,
            likes: 0,
            imageUrl: imageUrl.absoluteString, // Store the URL as a string
            timestamp: Timestamp()
        )
        
        // Encode and save the post
        let encodedPost = try Firestore.Encoder().encode(post)
        try await postRef.setData(encodedPost)
    }
}
