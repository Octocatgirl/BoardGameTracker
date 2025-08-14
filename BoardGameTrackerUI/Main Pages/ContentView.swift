//
//  ContentView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/13/25.
//

import SwiftUI


//
//struct ContentView: View {
//    @State var appUser: Account? = nil
//    
//    var body: some View {
//        ZStack {
//            if let appUser = appUser {
//                //HomeView(appUser: $appUser)
//                Text("Welcome, \(appUser.email)")
//            } else {
//                SignInView(appUser: $appUser)
//            }
//        }
//        .onAppear {
//            Task {
//                self.appUser = try await AuthManager.shared.getCurrentSession()
//            }
//        }
//    }
//}
