//
//  PopupWarningView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/31/25.
//

import SwiftUI

struct PopupWarningView: View {
    @Binding var warning: String
    @Binding var isVisible: Bool
   
    
    var body: some View {
        ZStack{
           
            VStack {
                Text(warning).font(.headline).padding(20)
                Button("Ok"){
                isVisible = false
                    }.foregroundColor(Color.red)
                        .padding(20)
    
            }.frame(minWidth: 300,  minHeight: 150)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
         
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.8))
    }
}

