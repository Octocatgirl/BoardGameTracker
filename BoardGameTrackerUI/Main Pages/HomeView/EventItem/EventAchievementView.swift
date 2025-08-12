//
//  EventAchievementView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/1/25.
//

import SwiftUI

struct EventAchievementView: View {
    var label: String
    var hasValue: Bool
    @State var value: String
    @State var isAchieved: Bool
    
    var body: some View {
        if isAchieved {
            
            HStack {
                HStack {
                    Text("Achievement:")
                        .fontWeight(.bold)
                    Text(label)
                    if hasValue {
                        Text("+" + value)
                    }
                }
                .padding()
                .font(.system(size: 20, design: .rounded))
                
                Spacer()
            }
            
        } else {
            EmptyView()
        }
    }
}

#Preview {
  
        EventAchievementView(label: "Longest Road", hasValue: true, value: "5", isAchieved: true)

}



