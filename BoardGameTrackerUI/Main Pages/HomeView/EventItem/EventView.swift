    //
    //  EventView.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee on 7/29/25.
    //

import SwiftUI

struct EventView: View {
    @ObservedObject var account: Account
    @State var team: Team
    @State var data: [TemplateSection]
    
    var body: some View {
        LazyVStack(alignment: .leading){
            HStack {
                Spacer()
                Text(team.getString())
                    .font(.title2)
                Spacer()
            }
           
            
            ForEach(data){ section in
                switch section.type {
                case .Score: EventScoreView(label: section.label, value: section.value)
                case .Achievement: EventAchievementView(label: section.label, hasValue: section.hasValue, value: section.value, isAchieved: section.boolValue)
                }
            }
            
        }
        Spacer()
    }
}

