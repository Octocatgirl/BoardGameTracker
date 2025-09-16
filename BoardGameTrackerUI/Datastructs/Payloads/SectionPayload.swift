//
//  SectionPayload.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 9/10/25.
//
import Foundation

struct SectionPayload: Codable {
    let id: UUID
    let label: String
    let type: String
    let hasValue: Bool
    let value: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case label
        case type
        case hasValue = "has_value"
        case value
    }
}
