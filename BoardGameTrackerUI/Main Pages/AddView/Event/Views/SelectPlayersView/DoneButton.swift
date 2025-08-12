//
//  DoneButton.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/1/25.
//

import SwiftUI

struct DoneButton: View {
    @State var checkPlayersSelected: () -> Bool
    @State var addSoloPlayers: ()  -> Void
    @State var event: Event
    @State var newDataList: () -> [Team:[TemplateSection]]
    @ObservedObject var account: Account
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Done"){
            if checkPlayersSelected() {
                var data: [Team:[TemplateSection]] = [:]
                
                    addSoloPlayers()
                    data =  newDataList()
                    event.updateData(newData: data)
                    account.add_event(event: event)
                    dismiss()
                
               
            }
            
        }.padding(25)
            .foregroundColor(Color.accent)
            .fontWeight(.bold)
    }
    
    
}
