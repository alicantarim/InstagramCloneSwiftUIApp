//
//  FeedView.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 2.05.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    //ForEach(0...10, id:\.self) { post in
                    ForEach(Post.MOCK_POST) { post in
                        FeedCell(post: post)
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("instalogo")
                        .resizable()
                        .frame(width: 100, height: 32)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
