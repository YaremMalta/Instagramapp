//
//  ProfileHeaderView.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 1.09.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user : User
    @State private var showEditProfile = false
    
    
    var body: some View {
        VStack {
            // Header
            VStack(spacing: 10) {
                // Pic and stats
                HStack {
                    CircularProfileImageView(user: user,size: .large)
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        UserStatView(value: 3, title: "Posts")
                        UserStatView(value: 150, title: "Followers")
                        UserStatView(value: 150, title: "Following")
                    }
                }
                .padding(.horizontal)
                
                // Name and bio
                VStack(alignment: .leading, spacing: 4) {
                    
                    if let fullname = user.fullname {
                        Text(fullname)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // Action button
                Button {
                    if user.isCurrentUser {
                        showEditProfile.toggle()
                    } else {
                        print ("Follow user ..")
                    }
                    
                } label: {
                    Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .background(user.isCurrentUser ? .white : Color(.systemBlue))
                        .foregroundColor(user.isCurrentUser ? .black : .white)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(user.isCurrentUser ? .gray : .clear , lineWidth: 1)
                        )
                }
                
                Divider()
            }
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user:user)
            }
        }
    }
    
}
struct ProfileHeaderView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
  
