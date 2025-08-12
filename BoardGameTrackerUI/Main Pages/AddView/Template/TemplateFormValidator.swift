//
//  TemplateFormValidator.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 7/14/25.
//

class FormValidator {
    func validate(_ sections: [FormSection]) -> [String] {
        var errors = [String]()

        for section in sections {
            for field in section.fields {
                if field.isRequired && field.value.isEmpty {
                    errors.append("Field '\(field.label)' is required.")
                }
            }
        }

        return errors
    }
}
