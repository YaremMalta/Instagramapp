//
//  UserService.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 4.09.2024.
//
import Foundation
import Firebase
import FirebaseFirestore

struct UserService {
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let firestore = Firestore.firestore()
        let documentRef = firestore.collection("users").document(uid)
        
        let snapshot = try await documentRef.getDocument()
        
        guard snapshot.exists else {
            throw NSError(domain: "UserService", code: -1, userInfo: [NSLocalizedDescriptionKey: "User document does not exist"])
        }
        
        guard let user = try? snapshot.data(as: User.self) else {
            throw NSError(domain: "UserService", code: -2, userInfo: [NSLocalizedDescriptionKey: "Failed to decode user data"])
        }
        
        return user
    }

    static func fetchAllUsers() async throws -> [User] {
        let firestore = Firestore.firestore()
        let snapshot = try await firestore.collection("users").getDocuments()
        
        return snapshot.documents.compactMap { document in
            do {
                return try document.data(as: User.self)
            } catch {
                print("Failed to decode user data for document \(document.documentID): \(error)")
                return nil
            }
        }
    }
}
