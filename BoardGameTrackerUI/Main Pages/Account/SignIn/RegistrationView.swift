//
//  RegistrationView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/13/25.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: SignInViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    @Binding var appUser: AppUser?
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                AppTextField(placeHolder: "Email address", text: $email)
                
                AppSecureField(placeHolder: "Password", text: $password)
            }
            .padding(.horizontal, 24)
            
            Button {
                Task {
                    do {
                        let appUser = try await viewModel.registerNewUserWithEmail(email: email, password: password)
                        self.appUser = appUser
                        dismiss()
                    } catch {
                        print("issue with sign in")
                    }
                }
            } label: {
                Text("Register")
                    .padding()
                    .foregroundColor(Color(uiColor: .systemBackground))
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(Color(uiColor: .label))
                    }
            }
            .padding(.top, 12)
            .padding(.horizontal, 24)
        }
    }
}
