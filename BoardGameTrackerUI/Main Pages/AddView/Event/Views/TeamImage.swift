//
//  TeamImage.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/30/25.
//
import SwiftUI

struct TeamImage: View {
    @Binding var team: Team
    var body: some View {
        ForEach($team.members) { member in
           Image( member.wrappedValue.image())
                .resizable()
                .frame(width: 32, height: 32)
        }
    }
}
