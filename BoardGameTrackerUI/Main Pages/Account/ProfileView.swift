//
//  ProfileView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/1/25.
//

import SwiftUI
import SwiftData


struct ProfileView : View {
    @Binding var user: AppUser?
    @ObservedObject var account: Account
    
    var body: some View {
        VStack {
            Text("Email: \(account.username())")
            Text("Friend Code: ")
            Spacer()
            Button("Sign out") {
                Task {
                      do {
                          try await AuthManager.shared.signOut()
                          // set to nil to because user is keeping prevous session
                          user = nil
                          print("Signed out successfully")
                          
                      } catch {
                          print("Error signing out: \(error.localizedDescription)")
                      }
                  }
            }
            .foregroundColor(.red)
            .padding()
        }
    }
}
