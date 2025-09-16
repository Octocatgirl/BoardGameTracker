    //
    //  TemplateEventForm.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee on 7/29/25.
    //

import SwiftUI

struct TemplateEventForm: View {
    @Binding var sections: [TemplateSection]
    
    var body: some View {
        List($sections) { s in
            if s.wrappedValue.type == .Score {
                ScoreView(lable: s.wrappedValue.label, value: s.value)
            }
            else if s.wrappedValue.type == .Achievement {
                AchievementView(lable: s.wrappedValue.label, hasValue: s.wrappedValue.hasValue, value: s.wrappedValue.value, isAchieved: s.boolValue)
            }
        }.listStyle(.inset)
        
    }
}
