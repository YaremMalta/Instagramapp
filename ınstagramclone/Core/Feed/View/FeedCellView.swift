//
//  FeedCellView.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 27.08.2024.
//

import SwiftUI
import Kingfisher

struct FeedCellView: View {
    let post : Post
    
    var body: some View {
        VStack {
            // image + username
            HStack {
                if let user = post.user{
                    CircularProfileImageView(user: user, size: .xSmall)
                      
                    Text (user.username)
                          .font(.footnote)
                          .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.leading , 8)
            // post image
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height:400)
                .clipShape(Rectangle())
            
            // action buttons
            HStack(spacing:16){
                Button {
                    print ("Like post")
                }label: {
                    Image (systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    print ("Commet on post ")
                }label: {
                    Image (systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    print ("Share post")
                }label: {
                    Image (systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
        
            }
            .padding(.leading , 8)
            .padding (.top, 4)
            .foregroundColor(.black)
            // like label
            
            Text("\(post.likes) likes ")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth : .infinity , alignment: .leading)
                .padding(.leading ,10)
                .padding(.top , 1)
            // caption label
            HStack {
                Text ("\(post.user?.username ?? "")").fontWeight(.semibold) +
                Text("  ") +
                Text (post.caption)
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .font(.footnote)
            .padding(.leading,10)
            .padding(.top , 1)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding(.leading , 10)
                .padding(.top , 1)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    FeedCellView(post: Post.MOCK_POSTS[0])
}
