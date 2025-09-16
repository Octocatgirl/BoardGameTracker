//
//  BoardGameTrackerUIApp.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/1/25.
//

import SwiftUI
import SwiftData

@main
struct BoardGameTrackerUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema()
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    
    @State var user: Account?
    
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if user != nil {
                    MainMenuView(appUser: $user)
                }
                else {
                    SignInView(appUser: $user)
                }
            } .onAppear {
                Task {
                    do {
                        self.user = try await AuthManager.shared.getCurrentSession()
                    } catch {
                        print("No session")
                    }
                }
            }
        }
        .modelContainer(sharedModelContainer)
        
    }
}


