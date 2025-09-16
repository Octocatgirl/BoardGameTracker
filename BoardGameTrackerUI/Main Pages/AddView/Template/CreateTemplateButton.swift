//
//  CreateTemplateButton.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/1/25.
//

import SwiftUI

struct CreateTemplateButton: View {
    @Binding var paths: NavigationPath
    @ObservedObject var account: Account
    @Binding var isTabBarVisible: Bool
    
    var body: some View {
        
        VStack {
            HStack {

                Button(action: {
                    isTabBarVisible = false
                    paths.append(0)
                }){
                    Image(systemName: "plus")
                        .padding(7)
                }
                .dynamicTypeSize(.medium)
                .labelStyle(IconOnlyLabelStyle())
                .buttonStyle(PlainButtonStyle())
                .background(Color.brightOrange)
                .foregroundColor(.white)
                .cornerRadius(100)
                .padding(.horizontal)
            }
        }
        .background(Color.clear)
        
    }
    
}
