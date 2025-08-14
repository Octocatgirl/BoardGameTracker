////
////  Untitled.swift
////  BoardGameTrackerUI
////
////  Created by Shaylee on 8/4/25.
////
//
//import SwiftUI
//
//struct SignUpView: View {
//    @Environment(\.dismiss) var dismiss
//    @EnvironmentObject var auth: AuthViewModel
//    
//    @State private var username = ""
//    @State private var password = ""
//    @State private var confirmPassword = ""
//    @State private var errorMessage = ""
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Create Account").font(.largeTitle).bold()
//            
//            TextField("Username", text: $username)
//                .autocapitalization(.none)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            SecureField("Password", text: $password)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            SecureField("Confirm Password", text: $confirmPassword)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            if !errorMessage.isEmpty {
//                Text(errorMessage).foregroundColor(.red)
//            }
//
//            Button("Sign Up") {
//                guard password == confirmPassword else {
//                    errorMessage = "Passwords do not match"
//                    return
//                }
//                if auth.signUp(username: username, password: password) {
//                    dismiss()
//                } else {
//                    errorMessage = "Username already exists or fields are empty"
//                }
//            }
//            .buttonStyle(.borderedProminent)
//        }
//        .padding()
//    }
//}
//
//
