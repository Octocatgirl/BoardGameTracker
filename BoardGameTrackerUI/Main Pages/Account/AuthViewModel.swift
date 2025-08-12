//
//  AuthViewModel.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 8/4/25.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var registeredUsers: [String: String] = [:] //username: password
    
    func signUp(username: String, password: String) -> Bool {
        guard !username.isEmpty, !password.isEmpty else { return false }
        guard registeredUsers[username] == nil else { return false } // already exists
        registeredUsers[username] = password
        return true
    }
    
    func signIn(username: String, password: String) -> Bool {
        guard registeredUsers[username] == password else { return false }
        isAuthenticated = true
        return true
    }
}
