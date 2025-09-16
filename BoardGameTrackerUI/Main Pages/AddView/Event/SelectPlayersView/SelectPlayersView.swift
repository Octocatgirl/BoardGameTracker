//
//  SelectTeamView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 7/24/25.
//
import SwiftUI

struct SelectPlayersView: View {
    // keep passing template to use
    @Binding var paths: NavigationPath
    @ObservedObject var account: Account
    var template: Template
    
    @State var selectedPlayers: [Bool] = []
    @State var teams: [Team] = []
    @State var takenPlayers: [Int] = [] // indexs of players put in teams
    
    @State var teamName: String = ""
    @State var warning: String = ""
 
    @State var createTeam: Bool = false
    @State var showPopup: Bool = false
    @State var showWarning: Bool = false
    
    @Environment(\.dismiss) var dismiss
 
    
    var body: some View {
        VStack {
            Text("Select Players")
                .font(.headline)
                .padding()
            
            AccountGridView(accountList: accountList(), selectedAccounts: $selectedPlayers, locked: $takenPlayers)
            
            HStack {
                TeamButton(checkPlayersSelected: self.checkPlayersSelected, showPopup: $showPopup)
                Spacer()
                DoneButton(checkPlayersSelected: checkPlayersSelected, addSoloPlayers: addSoloPlayers, event: newEvent(), newDataList: newDataList, account: account)
                Spacer()
                DetailsButton(paths: $paths, teams: $teams, account: self.account, template: self.template, newEvent: newEvent, newDataList: newDataList, checkPlayersSelected: self.checkPlayersSelected, addSoloPlayers: self.addSoloPlayers)
                
            }
            
        }.onAppear{
            clearSoloTeams()
        }
        .overlay(alignment: .center){
            if showPopup {
                PopupQueryView(query:"Name Team", isVisible: $showPopup, result: $teamName, queryAnswered: $createTeam)
                    .onDisappear {
                        // add new team if ok was clicked
                        if createTeam {
                            if teamName == "" {
                                teamName = "DEFAULT"
                            }
                            teams.append(Team(name: teamName, members: getSelectedPlayers()))
                            takenPlayers.append(contentsOf: getSelectedPlayersIndex())
                            createTeam = false
                            
                        }
                        teamName = ""
                    }
            }
            else if showWarning {
                PopupWarningView(warning: $warning, isVisible: $showWarning)
            }
            else {
                EmptyView()
            }
        }
       
    }
    
    
    func getSelectedPlayers()-> [Account] {
        //
        // takes [Bool] where true is selected players index
        // returns [Accounts] of the selected players from
        // logged in account
        //
        var players: [Account] = []
        for i in selectedPlayers.indices {
            if selectedPlayers[i] && !takenPlayers.contains(i){
                if i == 0 {
                    players.append(account)
                }else{
                    players.append(account.getFriend(index: i-1))
                }
            }
        }
        return players
        
    }
    
    func addSoloPlayers()  {
        if selectedPlayers.filter({ $0 }).count > 0 {
            for player in getSelectedPlayers() {
                
                teams.append(Team(name: "DEFAULT", members: [player]))
            }
        }
    }
    
    func getSelectedPlayersIndex() -> IndexSet {
        return  IndexSet(selectedPlayers.enumerated().compactMap { $0.element ? $0.offset : nil })
        
    }
    
    func accountList() -> [Account] {
        var alist = [account]
        alist.append(contentsOf: account.friendsList())
        return alist
    }
    
    func checkPlayersSelected() -> Bool {
        if selectedPlayers.count(where: {$0}) == 0 {
            warning = "At least one player must be selected."
            showWarning.toggle()
            return false
        }
        return true
    }
    
    func newEvent() -> Event {
        return Event(name: template.title, template: template)
    }
    
    func newDataList()  -> [Team: [TemplateSection]] {
        return generateDataList(temp: template, teams: self.teams)
    }
    
    func clearSoloTeams() {
        teams.removeAll(where: {$0.members.count == 1})
    }
    
   
    
}


