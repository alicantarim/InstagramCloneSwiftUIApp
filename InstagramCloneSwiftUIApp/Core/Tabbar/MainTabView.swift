//
//  MainTabView.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 2.05.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    let user: User
    
    var body: some View {
        TabView(selection: $selectedIndex){
            //Text("Feed")
            FeedView()
                .onAppear() {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            //Text("Search")
            SearchView()
                .onAppear() {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            //Text("Upload Post")
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear() {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            Text("Notifications")
                .onAppear() {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }
                .tag(3)
            //Text("Profile")
            CurrentUserProfileView(user: user)
                .onAppear() {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
        }
        .tint(Color("tabBarItemColor")) // Tabbar rengi
    }
}

#Preview {
    MainTabView(user: User.MOCK_USER[0])
}
