//
//  TeamListView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/2/25.
//

import SwiftUI

struct TeamListView: View {
    @ObservedObject  var account: Account
    @Binding var paths: NavigationPath
    
    var teams: [Team]
    var eventData: [Team : [TemplateSection]]
   
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(teams) { team in
                    Button(action: {
                        paths.append(team)
                    }){
                        Text(team.getString())
                            .padding()
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color.brightPurple)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .cornerRadius(10)
                }
            }.padding()
        }.navigationDestination(for: Team.self){team in
            EventView(account: account, team: team, data: eventData[team] ?? [])
        }
        
    }
}
