//
//  SignAccountView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 8/4/25.
//

import SwiftUI

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    
    @State private var email = ""
    @State private var password = ""
    @State private var isRegistrationPresented = false
    @State private var errorMessage = ""
    
    @Binding var appUser: Account?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign In").font(.largeTitle).bold()
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !errorMessage.isEmpty {
                Text(errorMessage).foregroundColor(.red)
            }
            
            Button {
                Task {
                    do {
                        let appUser = try await viewModel.signInWithEmail(email: email, password: password)
                        self.appUser = appUser
                        print("Session is now: \(String(describing: appUser))")
                    } catch {
                        errorMessage = "Error with sign in"
                    }
                }
            } label: {
                Text("Sign In")
                    .padding()
                    .foregroundColor(Color(uiColor: .systemBackground))
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(Color(uiColor: .label))
                    }
            }
            .padding(.horizontal, 24)
            
            
            Button("Don't have an account? Sign Up") {
                isRegistrationPresented.toggle()
            }
            .sheet(isPresented: $isRegistrationPresented ) {
                RegistrationView(appUser: $appUser)
                    .environmentObject(viewModel)
            }
        }
        .padding()
    }
}



