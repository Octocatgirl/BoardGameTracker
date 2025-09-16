//
//  TemplateSectionPayload.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 9/10/25.
//
import Foundation

struct TemplateSectionPayload: Codable {
    let templateId: UUID
    let sectionId: UUID
    let order: Int
    
    private enum CodingKeys: String, CodingKey {
        case templateId = "template_id"
        case sectionId = "section_id"
        case order
    }
}

struct SectionParams: Encodable {
    let _label: String
    let _type: String
    let _has_value: Bool
    let _value: String
}


struct TemplateListItem: Decodable, Identifiable {
    let id: UUID
    let title: String
    let user_id: UUID
    let created_at: String
}
