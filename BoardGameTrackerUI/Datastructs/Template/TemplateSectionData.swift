//
//  SectionData.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/15/25.
//

import Foundation

enum SelectableType {
    case Score, Achievement
}

enum SectionType: String, Codable{
    case Score = "Score"
    case Achievement = "Achievement"
}

struct TemplateSection: Identifiable, Equatable, Decodable {
    var id = UUID()
    var label: String
    var type: SectionType
    var hasValue: Bool = true
    var value: String = ""
    var boolValue: Bool = false
}



