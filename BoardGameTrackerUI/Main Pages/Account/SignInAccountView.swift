//
//  SignAccountView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 8/4/25.
//

import SwiftUI

import SwiftUI

struct SignInView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showSignUp = false
    @State private var errorMessage = ""
    @EnvironmentObject var auth: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign In").font(.largeTitle).bold()
            
            TextField("Username", text: $username)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if !errorMessage.isEmpty {
                Text(errorMessage).foregroundColor(.red)
            }
            
            Button("Sign In") {
                if !auth.signIn(username: username, password: password) {
                    errorMessage = "Invalid credentials"
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button("Don't have an account? Sign Up") {
                showSignUp = true
            }
            .sheet(isPresented: $showSignUp) {
                SignUpView()
                    .environmentObject(auth)
            }
        }
        .padding()
    }
}
