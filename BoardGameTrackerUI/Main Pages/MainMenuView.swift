    //
    //  ContentView.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee on 7/1/25.
    //

import SwiftUI
import SwiftData

struct MainMenuView: View {
    @Environment(\.modelContext) private var _modelContext
    let screenSize: CGRect = UIScreen.main.bounds
    @Binding var appUser: Account?
    // database connection
        // sets what the current page it starts with
        // can edit for certain functions too
    @State var selectedTab = 1
    
    var body: some View {
      
            TabView(selection: $selectedTab){
                HomeView(account: appUser!)
                    .tabItem{
                        Image(systemName: "house")
                    }.tag(0)
                AddView(account: appUser!)
                    .tabItem{
                        Image( systemName: "plus.square")
                    }.tag(1)
                ProfileView(user: $appUser)
                // make the image the account image
                    .tabItem{
                        Image(systemName: "person.crop.circle")
                    }.tag(2)
            
        }
    }

}



