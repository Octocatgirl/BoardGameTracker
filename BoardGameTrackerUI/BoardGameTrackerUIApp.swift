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

    var body: some Scene {
        WindowGroup {
            MainMenuView(account:createTestAccount())
        }
        .modelContainer(sharedModelContainer)
    }
}


func createTestAccount(friends: Int = Int.random(in: 3..<25), templates: Int = 1, events: Int = 0 ) -> Account{
    let ac = Account(username: "Your Name", password: "")
    for _ in 0..<friends{
        let newFriend = Account(username: "Friend \(Int.random(in: 0..<100))", password: "")
        ac.add_friend(otherAccount: newFriend)
    }
    for _ in 0..<templates {
        let temp = Template(name: "Game \(Int.random(in: 0..<100))")
        ac.add_template(template: temp)
    }
    for _ in 0..<events {
        for temp in ac.templates {
            let  event = Event(name: temp.name, template: temp)
            ac.add_event(event: event)
        }
    }
        

    
    
    return ac
}

#Preview {
    MainMenuView(account:createTestAccount())
}

