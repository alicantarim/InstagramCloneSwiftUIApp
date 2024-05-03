//
//  RegisterViewModel.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 3.05.2024.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func createUser() async throws {
        // validatete hata varsa return false doner kullaniciyi olusturmayacak.
        guard validate() else {
            return
        }
        
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        username = ""
        email = ""
        password = ""
        errorMessage = ""
    }
    
    // Validasyon Islemleri - Hata Kontrollerı
    // CompleteSignUp' da createUser cagirdigimiz icin orada bu hatalari gosterecegim.
    func validate() -> Bool {
        errorMessage = ""
        
        // email kontrol
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter email."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        // password kontrol
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter password"
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Please enter a password longer than 6 characters."
            return false
        }
        return true
    }
}
