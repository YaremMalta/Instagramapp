//
//  CurrentUserProfileView.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 28.08.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user : User
    
    var posts : [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                
                // Grid
                
                PostGridView (user: user)
            }
            
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        AuthService.shared.signout()
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    
    struct CurrentUserProfileView_Previews: PreviewProvider {
        static var previews: some View {
            CurrentUserProfileView(user: User.MOCK_USERS[0])
        }
    }
}
