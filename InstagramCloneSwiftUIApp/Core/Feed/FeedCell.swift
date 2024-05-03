//
//  FeedCell.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 2.05.2024.
//

import SwiftUI

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            // Profil Foto ve Kullanici Adi
            HStack {
                if let user = post.user {
                    //Image("Lavinya3")
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    //Text("lavinyagunes")
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("buttonTextColor"))
                    Spacer()
                }
            }
            .padding(.leading, 8)
            
            // Post Gorseli
            //Image("Lavinya3")
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
           
            // Action Butonlari
            HStack {
                Button{} label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button{} label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button{} label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(Color("buttonTextColor"))
            
            // Begeni sayisi
            //Text("300 likes")
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // Aciklama kismi
            HStack {
                //Text("lavinyagunes")
                Text("\(post.user?.username ?? "")")
                    .fontWeight(.semibold) +
                //Text("Merhaba, Instagrama yeni katildim. begenilerinizi bekliyorum.")
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("10h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POST[0])
}
