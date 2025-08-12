//
//  TemplateFormView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 7/14/25.
//

import SwiftUI

struct FormView: View {
    @Binding var sections: [FormSection]
    
    var body: some View {
        Form {
            ForEach(sections.indices, id: \.self) { sectionIndex in
                Section(header: Text(sections[sectionIndex].title)){
                    ForEach(sections[sectionIndex].fields.indices, id: \.self) { fieldIndex in
                        let field = sections[sectionIndex].fields[fieldIndex]
                        switch field.type {
                        case .text:
                            TextField(field.label, text: $sections[sectionIndex].fields[fieldIndex].value)
                                .autocapitalization(.none)
                            
                            
                        case .toggle:
                            Toggle(field.label, isOn: .init(
                                get: { return sections[sectionIndex].fields[fieldIndex].value == "true" },
                                set: { sections[sectionIndex].fields[fieldIndex].value = $0 ? "true" : "false" }
                            ))
                        }
                        
                    }
                    if sections[sectionIndex].title != "Template Name" {
                        HStack{
                            Spacer()
                            // section actions, only avaible in sections that are not name of template
                            DeleteSectionButton(buttonAction: {sections.remove(at:sectionIndex)})
//                            work on duplicate button later version....
    //                        DuplicateSectionButton(buttonAction: {sections.append(duplicateSection(sect: sections[sectionIndex]))})
                        }
                    }
                   
                }.help(sections[sectionIndex].subtitle.unsafelyUnwrapped)
            }
        }
    }
}


struct DeleteSectionButton: View
{
    var buttonAction:() -> Void
    
    var body: some View
    {
        Button(action: buttonAction) {
            Image(systemName: "trash")
                .foregroundColor(.red)
        }.buttonStyle(BorderlessButtonStyle())
    }
}

struct DuplicateSectionButton: View {
    var buttonAction:() -> Void
    
    var body: some View
    {
        Button(action: buttonAction) {
            Text("Duplicate")
        }
    }
}

func duplicateSection(sect: FormSection) -> FormSection {
    return FormSection(title: sect.title,fields: sect.fields)
    //            fields: [
    //                ForEach(sect.fields.indices, id: \.self) { fieldIndex in
    //                    let field = sect.fields[fieldIndex]
    //                    FormField(
    //                        label: field.label,
    //                        type: field.type,
    //                        value: field.value,
    //                        options: field.options,
    //                        isRequired: field.isRequired
    //                    )
    //                }
    //
    //            ]
    
}

