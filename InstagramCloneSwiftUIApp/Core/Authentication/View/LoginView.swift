//
//  LoginView.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 2.05.2024.
//

import SwiftUI

struct LoginView: View {
    
    //@State private var email = ""
    //@State private var password = ""
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            Spacer()
            Image("instalogo")
                .resizable()
                .scaledToFit()
                .frame(width: 220, height: 100)
            
            VStack(spacing: 12) {
                //TextField("Enter your email...", text: $email)
                TextField("Enter your email...", text: $viewModel.email)
                    .textInputAutocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                
                //SecureFieldWithButton("Enter your password", text: $password)
                SecureFieldWithButton("Enter your password", text: $viewModel.password)
            }
            
            Button{
                //print("LOGIN BUTTON")
                Task { try await viewModel.signIn() }
            } label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color("buttonTextColor"))
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("buttonTextColor"), lineWidth: 1)
            )
            .padding(.horizontal, 24)
            .padding(.top, 12)
            
            Button{
                print("FORGET PASSWORD")
            } label: {
                Text("Forget Password")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing, 24)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            HStack {
                Rectangle()
                    .frame(height: 0.5)
                
                Text("OR")
                    
                Rectangle()
                    .frame(height: 0.5)
            }
            .padding(.horizontal, 24)
            .foregroundStyle(.gray)
            
            HStack {
                Image("facebook")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Continue with Facebook")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.systemBlue))
            }
            .padding(.top, 8)
            
            Spacer()
            
            Divider()
            NavigationLink {
                AddEmailView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack {
                    Text("Don't have an acocunt")
                    
                    Text("Sign up")
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    LoginView()
}
