//
//  EditProfileView.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 3.05.2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var fullname = ""
    @State private var boi = ""
    
    var body: some View {
        VStack {
            // Toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.bold)
                }
                .padding()
                
                Divider()
            }
            
            PhotosPicker(selection: $selectedImage) {
                VStack {
                    Image(systemName: "person")
                        .resizable()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $bio)
            }
            
            Spacer()

            
        }
    }
}

#Preview {
    EditProfileView()
}
