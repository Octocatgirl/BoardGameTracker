    //
    //  TemplateClass.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee on 7/15/25.
    //


import Foundation


enum SectionType {
    case Score, Achievement
}



public class Template : Identifiable{
    public var id: UUID = UUID()
    public var name: String
    // indicates what type of form view to create and the values of it
    var sections: [TemplateSection]
    weak var account: Account?
    
    
    public init(name: String) {
        self.name = name
        self.sections = []
    }
    
    public func addScoreSection(name: String) {
        sections.append(TemplateSection(label: name, type: .Score, value: "0"))
    }
    
    public func addAchievementSection(name: String, hasValue: Bool, value: String) {
        sections.append(TemplateSection(label: name, type: .Achievement, hasValue: hasValue, value: value))
    }
    
}


   
