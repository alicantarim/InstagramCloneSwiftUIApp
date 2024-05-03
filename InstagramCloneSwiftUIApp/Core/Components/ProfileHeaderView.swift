//
//  ProfileHeaderView.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 3.05.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: 10) {
            // Profil Karti
            HStack {
                //Image("Lavinya3")
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(value: 200, title: "Posts")
                    UserStatView(value: 1200, title: "Followers")
                    UserStatView(value: 1200, title: "Following")
                }
            }
            .padding(.horizontal)
            
            // Isim ve Aciklama Kismi
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    //Text("Lavinya Tarim")
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    //Text("Merhaba, Instagram kullaniyorum.")
                    Text(bio)
                        .font(.footnote)
                }
                
                Text(user.username)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // Edit Profil
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(Color("buttonTextColor"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER[0])
}
