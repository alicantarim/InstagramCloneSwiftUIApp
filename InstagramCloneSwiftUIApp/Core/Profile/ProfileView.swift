//
//  ProfileView.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 2.05.2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POST.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
            ScrollView {
                VStack {
                    // MARK: - HEADER
                    ProfileHeaderView(user: user)
                    // MARK: - POSTS
                    PostGridView(posts: posts)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

#Preview {
    ProfileView(user: User.MOCK_USER[0])
}
