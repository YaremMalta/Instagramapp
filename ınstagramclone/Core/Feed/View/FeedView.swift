//
//  FeedView.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 27.08.2024.


import SwiftUI
struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 30) {
                    ForEach(viewModel.posts) { post in
                        FeedCellView(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Instagramlogo")
                        .resizable()
                        .frame(width: 100, height: 32)
                }
                
               
            }
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchPosts()
                } catch {
                    print("Error fetching posts: \(error)")
                }
            }
        }
    }
}
