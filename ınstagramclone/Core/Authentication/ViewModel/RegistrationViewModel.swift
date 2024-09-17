//
//  RegistrationViewModel.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 2.09.2024.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        await MainActor.run {
            self.username = ""
            self.email = ""
            self.password = ""
        }
    }
}
