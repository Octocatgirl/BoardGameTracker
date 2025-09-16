//
//  TemplateFormData.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 7/14/25.
//

import Foundation

enum FieldType {
    case text, toggle
}

struct FormField {
    let id = UUID()
    var label: String
    var type: FieldType
    var value: String
    var options: [String]?
    var isRequired: Bool
}

struct FormSection {
    let id = UUID()
    var title: String
    var fields: [FormField]
    var subtitle: String?
}

