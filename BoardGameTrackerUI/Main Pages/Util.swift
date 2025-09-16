//
//  Util.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 7/15/25.
//

// simple utility functions

func asBool(_ input: String) -> Bool {
        if input == "true" {
        return true
    } else {
        return false
    }
    }



func generateDataList(temp: Template, teams: [Team]) -> [Team:[TemplateSection]] {
    var dataList : [Team:[TemplateSection]] = [:]
    for team in teams {
        dataList[team] = temp.sections
    }
    return dataList
}
