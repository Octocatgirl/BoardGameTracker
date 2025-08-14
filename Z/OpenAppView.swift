////
////  OpenAppView.swift
////  BoardGameTrackerUI
////
////  Created by Shaylee on 8/4/25.
////
//
//import SwiftUI
//import Supabase
//
//struct TestAccount: Decodable {
//    let id: Int
//    let username: String
//    let password: String
//}
//
//let database  = SupabaseClient(supabaseURL: URL(string: "https://krcyuvpyhwqfycpeusap.supabase.co")!, supabaseKey: "public-anon-key")
//
//
//func loadDatabase() async -> [TestAccount] {
//    do {
//       let  accounts: [TestAccount]  = try await database
//            .from("TestAccounts")
//            .select()
//            .execute()
//            .value
//        return accounts
//    }catch {
//        print("Database Error")
//        return []
//    }
//    
//}
//
//
//struct AuthApp: View {
//    @StateObject private var auth = AuthViewModel()
//   
////    @StateObject private var usersList =
//
//    var body: some View {
//       Group {
//            if auth.isAuthenticated {
//                Text("Welcome! You are signed in.")
//                    .font(.title)
//            } else {
//                SignInView()
//                    .environmentObject(auth)
//            }
//        }
//    }
//}
//
//
//#Preview {
//    AuthApp()
//}
