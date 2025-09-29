    //
    //  TemplateClass.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee on 7/15/25.
    //


import Foundation




struct TemplateListItem: Decodable, Identifiable {
    let id: UUID
    let title: String
    let user_id: UUID
    let created_at: String
}


// used for creating new section
public class Template : Identifiable{
    public var id: UUID = UUID()
    public var title: String
    // indicates what type of form view to create and the values of it
    var sections: [TemplateSection]
    weak var account: Account?
    
    
    public init(name: String) {
        self.title = name
        self.sections = []
    }
    
    public func addSections(_label: String, _type: String, _hasValue: Bool, _value: String) {
        self.sections.append(TemplateSection(label: _label, type: SectionType(rawValue: _type)!, hasValue: _hasValue, value: _value))
    }
    
    public func uploadSection() {
        // for keeping track of the order of the sections in template
   
        
        for index  in sections.indices {
            let section = sections[index]
            
            let sectionPayload = SectionParams(_label: section.label, _type: section.type.rawValue, _has_value: section.hasValue, _value: section.value)
            Task {
                do{
                    // try to add new section if not dupliacte
                    // returns id of the row of section (duplicate or new)
                    let uuid = try await DatabaseManager.shared.addNewSection(item: sectionPayload)
                    // connection between template and section
                    let tempSectPayload = TemplateSectionPayload(templateId: self.id, sectionId: uuid, order: index)
                    try await DatabaseManager.shared.addTemplateSection(item: tempSectPayload)
                } catch {
                    print("Error adding Section: \(error.localizedDescription)")
                    print(sectionPayload)
                }
            }
        }
    }
    
    public func addScoreSection(name: String) {
        sections.append(TemplateSection(label: name, type: .Score, value: "0"))
    }
    
    public func addAchievementSection(name: String, hasValue: Bool, value: String) {
        sections.append(TemplateSection(label: name, type: .Achievement, hasValue: hasValue, value: value))
    }
    
}




   
