//
//  Post.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 3.05.2024.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestampt: Date
    let user: User?
}

extension Post {
    static var MOCK_POST: [Post] = [
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "Lorem ipsum is simply dummy text of the printing and typesetting industry",
              likes: 123,
              imageUrl: "profile1",
              timestampt: Date(),
              user: User.MOCK_USER[0]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "Lorem ipsum is simply dummy text of the printing and typesetting industry",
              likes: 341,
              imageUrl: "profile2",
              timestampt: Date(),
              user: User.MOCK_USER[1]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "Lorem ipsum is simply dummy text of the printing and typesetting industry",
              likes: 521,
              imageUrl: "profile3",
              timestampt: Date(),
              user: User.MOCK_USER[2]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "Lorem ipsum is simply dummy text of the printing and typesetting industry",
              likes: 712,
              imageUrl: "profile4",
              timestampt: Date(),
              user: User.MOCK_USER[3]),
        .init(id: UUID().uuidString,
              ownerUid: UUID().uuidString,
              caption: "Lorem ipsum is simply dummy text of the printing and typesetting industry",
              likes: 718,
              imageUrl: "profile5",
              timestampt: Date(),
              user: User.MOCK_USER[4])
    ]
}
