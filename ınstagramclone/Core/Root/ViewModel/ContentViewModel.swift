//
//  ContentViewModel.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 2.09.2024.
//

import SwiftUI
import Firebase
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        setupSubscribes()
    }
    
    func setupSubscribes() {
        service.$userSession
            .receive(on: DispatchQueue.main) // Ana thread'de yayınlama işlemi
            .sink { [weak self] userSession in
                self?.userSession = userSession
            }
            .store(in: &cancellables)
        
        service.$currentUser
            .receive(on: DispatchQueue.main) // Ana thread'de yayınlama işlemi
            .sink { [weak self] currentUser in
                self?.currentUser = currentUser
            }
            .store(in: &cancellables)
    }
}
