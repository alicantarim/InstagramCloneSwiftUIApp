//
//  UserService.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 3.05.2024.
//

import Foundation
import Firebase

struct UserService {
    
//    // static -> UserService cagirilmadan bu fonksiyona ulasilamaz.
//    @MainActor
//    static func fetchAllUsers() async throws -> [User] {
//        var users = [User]()
//        // User collection daki tum dokumanlari getirecek.
//        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
//        
//        let documents = snapshot.documents
//        
//        for doc in documents {
//            //print(doc.data())
//            guard let user = try? doc.data(as: User.self) else { return users }
//            users.append(user)
//        }
//        
//        return users
//    }
    
    
    // YUKARDAKI CODE UN AYNISI
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        // User collection daki tum dokumanlari getirecek.
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        // Her aldigi dokumantasyonu User nesnesine dondurmeye calisip bir liste halinde kullaniciya donmesi.
        return snapshot.documents.compactMap({ try? $0.data(as: User.self)})
    }
}
