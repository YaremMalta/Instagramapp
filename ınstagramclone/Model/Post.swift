//
//  Post.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 29.08.2024.
//

import SwiftUI
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?

    enum CodingKeys: String, CodingKey {
        case id
        case ownerUid
        case caption
        case likes
        case imageUrl
        case timestamp
        case user
    }

    init(id: String, ownerUid: String, caption: String, likes: Int, imageUrl: String, timestamp: Timestamp, user: User? = nil) {
        self.id = id
        self.ownerUid = ownerUid
        self.caption = caption
        self.likes = likes
        self.imageUrl = imageUrl
        self.timestamp = timestamp
        self.user = user
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        ownerUid = try container.decode(String.self, forKey: .ownerUid)
        caption = try container.decode(String.self, forKey: .caption)
        likes = try container.decode(Int.self, forKey: .likes)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
        let timestampSeconds = try container.decode(Int64.self, forKey: .timestamp)
        timestamp = Timestamp(seconds: timestampSeconds, nanoseconds: 0)
        user = try container.decodeIfPresent(User.self, forKey: .user)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(ownerUid, forKey: .ownerUid)
        try container.encode(caption, forKey: .caption)
        try container.encode(likes, forKey: .likes)
        try container.encode(imageUrl, forKey: .imageUrl)
        try container.encode(timestamp.seconds, forKey: .timestamp)
        try container.encodeIfPresent(user, forKey: .user)
    }
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Bringer light and hope",
            likes: 1000,
            imageUrl: "aithusa.jpg",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Sunlight",
            likes: 1000,
            imageUrl: "stella2.jpg",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Moon Light",
            likes: 1000,
            imageUrl: "luna.jpg",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Loyal Friend",
            likes: 1000,
            imageUrl: "ronaldo.jpg",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "High energy with positive vibe",
            likes: 1000,
            imageUrl: "shadow.jpg",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[4]
        ),
    ]
}
