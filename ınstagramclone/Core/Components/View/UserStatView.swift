//
//  UserStatView.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 27.08.2024.
//

import SwiftUI

struct UserStatView: View {
    
    let value : Int
    let title : String
    
    var body: some View {
        VStack {
          Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 72)
    }
}

#Preview {
    UserStatView(value: 12, title: "Posts")
}
