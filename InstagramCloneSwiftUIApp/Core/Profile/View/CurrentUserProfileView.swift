//
//  CurrentUserProfileView.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 3.05.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var posts: [Post] {
        return Post.MOCK_POST.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
        NavigationStack {
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color("buttonTextColor"))
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USER[0])
}
