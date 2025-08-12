//
//  ProfileView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/1/25.
//

import SwiftUI
import SwiftData


struct ProfileView : View {
    @ObservedObject var account: Account
    
    var body: some View {
        VStack {
            Text("Username: ")
            Text("Password:")
            Text("Friend Code: ")
        }
    }
}
