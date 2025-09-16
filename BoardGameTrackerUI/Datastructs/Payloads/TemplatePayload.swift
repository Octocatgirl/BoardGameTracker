//
//  TemplatePayload.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 9/10/25.
//

import Foundation

struct TemplatePayload: Codable {
    let id: UUID
    let userId: UUID
    let title: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case title
    }
}
