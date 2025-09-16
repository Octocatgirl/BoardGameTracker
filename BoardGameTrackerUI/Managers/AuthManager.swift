//
//  AuthManager.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/13/25.
//

import Foundation
import Supabase

struct AppUser {
    let uid: String
    let email: String?
}

class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://cdfpguwsgfkkyynwqdan.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNkZnBndXdzZ2Zra3l5bndxZGFuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUxMTY4MjAsImV4cCI6MjA3MDY5MjgyMH0.V946TwcXZ-deLjYdPiphLbeUzyXUebT4fFvaOgyUdqs")
    
    
    
    func getCurrentSession() async throws -> Account {
        let session = try await client.auth.session
        return Account(uid: session.user.id, email: session.user.email ?? "")
    }
    
    // MARK: Registration
    func registerNewUserWithEmail(email: String, password: String) async throws -> Account {
        let regAuthResponse = try await client.auth.signUp(email: email, password: password)
        guard let session = regAuthResponse.session else {
            print("no session when registering user")
            throw NSError()
        }
        return Account(uid: session.user.id, email: session.user.email ?? "")
    }
    

    // MARK: Sign In
    func signInWithEmail(email: String, password: String) async throws -> Account {
        let session = try await client.auth.signIn(email: email, password: password)
        return Account(uid: session.user.id, email: session.user.email ?? "")
        
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
    }
    
   
    
}
