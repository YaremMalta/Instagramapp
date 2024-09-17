//
//  User.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 28.08.2024.
//
import SwiftUI
import Firebase
import FirebaseAuth

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, username: "Aithusa", profileImageUrl: nil, fullname: "Aithusa", bio: "Bringer of light and hope", email: "aithusa@gmail.com"),
        .init(id: UUID().uuidString, username: "Stella", profileImageUrl: nil, fullname: "Stella", bio: "Sunlight", email: "stella@gmail.com"),
        .init(id: UUID().uuidString, username: "Luna", profileImageUrl: nil, fullname: "Luna", bio: "Moon light", email: "luna@gmail.com"),
        .init(id: UUID().uuidString, username: "Ronaldo", profileImageUrl: nil, fullname: "Ronaldo", bio: "Loyal friend", email: "ronaldo@gmail.com"),
        .init(id: UUID().uuidString, username: "Shadow", profileImageUrl: nil, fullname: "Shadow", bio: "High energy with a positive vibe", email: "shadow@gmail.com")
    ]
}
