//
//  User.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 3.05.2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User{
    
    static var MOCK_USER: [User] = [
        .init(id: UUID().uuidString, username: "User1", profileImageUrl: "profile1", fullname: "User 1", bio: "Lorem ipsum is simply dummy text of the printing and typesetting industry,", email: "user1@gmail.com"),
        .init(id: UUID().uuidString, username: "User2", profileImageUrl: "profile2", fullname: "User 2", bio: "Lorem ipsum is simply dummy text of the printing and typesetting industry,", email: "user2@gmail.com"),
        .init(id: UUID().uuidString, username: "User3", profileImageUrl: "profile3", fullname: "User 3", bio: "Lorem ipsum is simply dummy text of the printing and typesetting industry,", email: "user3@gmail.com"),
        .init(id: UUID().uuidString, username: "User4", profileImageUrl: "profile4", fullname: "User 4", bio: "Lorem ipsum is simply dummy text of the printing and typesetting industry,", email: "user4@gmail.com"),
        .init(id: UUID().uuidString, username: "User5", profileImageUrl: "profile5", fullname: "User 5", bio: "Lorem ipsum is simply dummy text of the printing and typesetting industry,", email: "user5@gmail.com")
    ]
}
