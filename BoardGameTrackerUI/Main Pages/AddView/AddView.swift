//
//  AddView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/1/25.
//

import SwiftUI
import SwiftData



struct AddView : View {
    @State var paths = NavigationPath()
    @ObservedObject var account: Account
    @State var isTabBarVisible: Bool = true
    
    var body: some View {
        NavigationStack(path: $paths) {
            VStack{
                HStack {
                    Spacer()
                    Text("Select Game Template")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .onAppear{isTabBarVisible = true}
                    Spacer()
                    CreateTemplateButton(paths: $paths, account: account, isTabBarVisible: $isTabBarVisible)
                }
                
                TemplateListView(paths: $paths, account: account, isTabBarVisible: $isTabBarVisible)
                    
            }
            .toolbar(isTabBarVisible ? .visible : .hidden, for: .tabBar)
            .padding(.top, 10.0)
            .navigationDestination(for: Int.self) { dest in
                switch dest {
                case 0: TemplateFormContent(account: account)
                default: Text("@Add View ERROR!! Unaccounted path destination: \(dest)")
                }
            }
            
        }
        
    }
    
    
    
}





