//
//  MainTabView.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 26.08.2024.
//

import SwiftUI

struct MainTabView: View {
    
    let user : User
    
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView (selection : $selectedIndex){
         FeedView()
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
           SearchView()
                .onAppear{
                    selectedIndex = 1
                }
                  .tabItem {
                      Image(systemName: "magnifyingglass")
                  }.tag (1)
            
            UploadPostView(tabIndex : $selectedIndex)
                .onAppear{
                    selectedIndex = 2
                }
                  .tabItem {
                      Image(systemName: "plus.square")
                  }.tag (2)
            
            
          
            
            CurrentUserProfileView(user: user)
                .onAppear{
                    selectedIndex = 4
                }
                  .tabItem {
                      Image(systemName: "person")
                  }.tag(4)
        }
        .accentColor(.black)
    }
}

struct MainTableView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: User.MOCK_USERS[0])
    }        
}
