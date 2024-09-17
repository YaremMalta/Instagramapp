//
//  SearchViewModel.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 4.09.2024.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
        
    }
}
