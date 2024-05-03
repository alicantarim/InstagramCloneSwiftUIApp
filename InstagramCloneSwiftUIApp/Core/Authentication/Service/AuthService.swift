//
//  AuthService.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 3.05.2024.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            // CurrentUser'i dolduruyorum.
            try await loadUserData()
        } catch {
            print("Failed to log in with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email:String, password: String, username: String) async throws {
        print("Kullanicinin Emaili: \(email)")
        print("Kullanicinin Sifresi: \(password)")
        print("Kullanicinin Kullanici Adi: \(username)")
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("Hata: \(error.localizedDescription)")
        }
    }
    // User bilgisini email, id, username'i Database'e koyuyoruz.
    // Buradaki id bilgisini kullanici olusturulurken Authentication'in verdigi id yi aldim.
    func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        
    }
    
    @MainActor
    // Kullanicinin Firebase deki verilerini telefona yuklemek icin method
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        // auth daki current user in uid sini getiriyorum.
        // Currentuser id alamiyorsam kullanici giris yapmamistir.
        guard let currentUid = userSession?.uid else { return }
        // User collection unda currentUid ye sahip olan dokumani getirecek.
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        // Snapshot dan gelen datayi User modele sigdirip currenUser da publish olarak disariya yayinliyorum.
        self.currentUser = try? snapshot.data(as: User.self)
        
        
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    
}
