//
//  TeamData.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/21/25.
//

import Foundation


struct Team: Identifiable, Hashable, Equatable {
    var id = UUID()
    var name: String
    var members: [Account]
    
    func getString() -> String {
        var membersList: [String] = []
        
        for member in self.members {
            membersList.append(member.username())
        }
        
        return name == "DEFAULT" ? membersList.joined(separator: ", ") : name 
    }
    
    
    static func == (lhs: Team, rhs: Team) -> Bool {
           return lhs.id == rhs.id && lhs.name == rhs.name && lhs.members == rhs.members
       }

    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
           hasher.combine(name)
    }
}
