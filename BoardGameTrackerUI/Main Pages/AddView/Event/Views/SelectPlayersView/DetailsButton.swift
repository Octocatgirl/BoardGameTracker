    //
    //  DetailsButton.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee Coulter on 8/1/25.
    //

import SwiftUI

struct DetailsButton: View {
    @Binding var paths: NavigationPath
    @Binding var teams: [Team]
    @ObservedObject var account: Account
    @State var template: Template
    @State var newEvent: () -> Event
    @State var newDataList: ()   -> [Team : [TemplateSection]]
    
    @State var checkPlayersSelected: () -> Bool
    @State var addSoloPlayers: ()  -> Void
    @State var dataList: [Team : [TemplateSection]] = [:]
    @State var isLoading = true
    
    var body: some View {
        
        Button("Details"){
            if checkPlayersSelected() {
                isLoading = true
                paths.append("Template")
                Task {
                    await loadData()
                }
               
            }
        }
        .padding(25)
        .foregroundColor(Color.accent)
        .fontWeight(.bold)
        .navigationDestination(for: String.self) { dest in
            if dest == "Template"
            {
                Group {
                    if isLoading {
                        // replace with loading view later
                        Text("Loading...")
                    } else {
                        TemplateView(ac: account,
                                     template: template,
                                     paths: $paths,
                                     selectedTeam: teams[0],
                                     previousSelectedTeam: teams[0],
                                     teams: $teams,
                                     event: newEvent(),
                                     dataList: dataList,
                                     section: dataList[teams[0]] ?? [])
                    }
                }
            } else {
                Text("Error: Unexpected destination \(dest)")
            }
        }
    }
    
    func loadData() async {
        addSoloPlayers()
        dataList = newDataList()
        isLoading = false
    }
}

