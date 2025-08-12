//
//  HomeView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/1/25.

import SwiftUI




struct HomeView : View {
    @StateObject var account: Account
    @State var paths = NavigationPath()
    @State var isTabBarVisible: Bool = false
    
    var body: some View {
        NavigationStack(path: $paths) {
            EventListView(paths: $paths, account: account, isTabBarVisible: $isTabBarVisible)
            
        }
    }
}


