//
//  SearchView.swift
//  InstagramCloneSwiftUIApp
//
//  Created by Alican TARIM on 2.05.2024.
//

import SwiftUI

struct SearchView: View {
    
    @State private var serachText = ""
    @StateObject var viewModel = SearchVieModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    //ForEach(0...20, id:\.self) { user in
                    //ForEach(User.MOCK_USER) { user in
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                //Image("Lavinya3")
                                Image(user.profileImageUrl ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    //Text("lavinyagunes")
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    //Text("Lavinya Güneş Tarım")
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                }
                                .foregroundStyle(Color("buttonTextColor"))
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .searchable(text: $serachText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
