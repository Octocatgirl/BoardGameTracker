    //
    //  TemplateView.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee on 7/29/25.
    //
import SwiftUI

struct TemplateView : View {
    var ac: Account
    var template: Template
    @Binding var paths: NavigationPath
    @State var selectedTeam: Team
    @State var previousSelectedTeam: Team
    @Binding var teams: [Team]
    var event: Event
    @State var dataList: [Team:[TemplateSection]]
    @State var section: [TemplateSection]
    

    
    var body: some View {
        VStack {
            Text(template.name)
                .font(.headline)
            
//            TeamImage(team: $selectedTeam)
            
            Picker(selection: $selectedTeam, label: Text("Select Team")) {
                ForEach(teams) { team in
                        Text(team.getString()).tag(team)
                    }
            }.padding(20)
            .onChange(of: selectedTeam){
                dataList[previousSelectedTeam] = section
                section = dataList[selectedTeam] ?? []
                previousSelectedTeam = selectedTeam
                }
            
            
            TemplateEventForm(sections: $section)
            
            HStack {
                
                Spacer()
                Button(action:submitEvent) {
                    Text("Done")
                }
                .padding(25)
                .fontWeight(.bold).font(.system(size: 20, weight: .bold, design: .default))
            }.background(Color.white)
            
            
            
        }.background(Color.white)
            
        
    }
    
    func submitEvent(){
        event.updateData(newData: dataList)
        
        // add event to account who made it
        ac.add_event(event: event)
        
        // add event to all the other accounts associated with it
        for team in teams {
            for account in team.members {
                // check to make sure its not account who made it
                // because its already been added 
                if account != ac {
                    account.add_event(event: event)
                }
            }
        }
        
        paths.removeLast(paths.count)
    }
    
}



