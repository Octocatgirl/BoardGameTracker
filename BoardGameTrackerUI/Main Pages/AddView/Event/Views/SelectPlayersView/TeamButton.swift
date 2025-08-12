//
//  TeamButton.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/1/25.
//

import SwiftUI

struct TeamButton: View {
    @State var checkPlayersSelected: () -> Bool
    @Binding var showPopup: Bool
    
    var body: some View {
        Button("Team"){
            if checkPlayersSelected() {
                showPopup.toggle()
            }
        }.padding(25)
            .foregroundColor(Color.accent)
            .fontWeight(.bold)
    }
}
