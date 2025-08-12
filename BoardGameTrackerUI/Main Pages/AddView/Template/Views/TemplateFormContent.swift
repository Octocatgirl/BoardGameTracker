//
//  TemplateFormContent.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 7/14/25.
//

import SwiftUI

struct TemplateFormContent: View {
    @ObservedObject var account: Account
    @State private var alertSave: Bool = false
    @Environment(\.dismiss) var dismiss
    
    
    
    @State private var sections: [FormSection] = [
        // all templates require field for the name of the template
        FormSection(
            title: "Template Name",
            fields: [
                FormField(
                    label: "Board Game Name",
                    type: .text,
                    value: "",
                    options: nil,
                    isRequired: true
                )
                
            ],
            subtitle: "What is the name of the boardgame this template is for?"
        ),
        FormSection(
            title: ComponentTitle.Score.rawValue,
            fields: [
                FormField(
                    label: "Label",
                    type: .text,
                    value: "Score",
                    options: nil,
                    isRequired: true
                )
            ],
            subtitle: "This field creates a box in template to fill out score, most board games can just use the name 'Score' or 'Total Score'"
        ),
        FormSection(
            title: ComponentTitle.Achievement.rawValue,
            fields: [
                FormField(
                    label: "Label",
                    type: .text,
                    value: "Winner",
                    options: nil,
                    isRequired: true
                ),
                FormField(
                    label: "Has Value",
                    type: .toggle,
                    value: "false",
                    options: nil,
                    isRequired: true
                ),
                FormField(
                    label: "Value",
                    type: .text,
                    value: "",
                    options: nil,
                    isRequired: false
                )
            ],
            subtitle: "Even for board games without achievements have the achivement of winning, keep track of winners by adding a 'Winners' achievement. You can even give it a goofy value to be fun"
        )
        
    ]
    
    // view the page
    var body: some View {
        
        VStack {
            
            
            FormView(sections: $sections)
            
            HStack {
                Menu("Add Component", systemImage: "plus")  {
                    // the options for the menu
                    Button("Score Box") {AddPointsField()  }
                    Button("Achievement List") { AddAchievementField()}
                }.padding(20)
                
                Spacer()
                Button("Save"){
                    SaveTemplate()
                    // dimissing instead of alerting
//                    alertSave.toggle()
                }
                .alert(isPresented: $alertSave) {
                    Alert(
                        title: Text("Template is Saved!"),
                        message: Text("New Template " + sections[0].fields[0].value + " has been created!"),
                        dismissButton: .default(Text("OK"))
                    )
                }      }.padding(.horizontal)
        }
        
    }
    
    
    // view functions
    
    // save template infomation
    func SaveTemplate(){
        let temp = Template(name: sections[0].fields[0].value)
        
        for section in sections {
            
            if section.title == ComponentTitle.Score.rawValue {
                temp.addScoreSection(name:section.fields[0].value)
            }
            if section.title == ComponentTitle.Achievement.rawValue{
                temp.addAchievementSection(name: section.fields[0].value, hasValue: asBool(section.fields[1].value), value: section.fields[2].value)
            }
            
        }
        
        account.add_template(template: temp)
        dismiss()
    }
    
    // different type of componenet you can add
    
    // add the score field to screen
    func AddPointsField() {
        sections.append(
            FormSection(
                title: ComponentTitle.Score.rawValue,
                fields: [
                    FormField(
                        label: "Label",
                        type: .text,
                        value: "",
                        options: nil,
                        isRequired: true
                    )
                ],
                subtitle: "Name the category of a score, ie. 'Total Score' or 'Culture Points'"
            )
        )
        
    }
    
    // add an achievement field to screen
    // defined in the fuction
    func AddAchievementField() {
        sections.append(
            FormSection(
                title: ComponentTitle.Achievement.rawValue,
                fields: [
                    FormField(
                        label: "Label",
                        type: .text,
                        value: "",
                        options: nil,
                        isRequired: true
                    ),
                    FormField(
                        label: "Has Value",
                        type: .toggle,
                        value: "",
                        options: nil,
                        isRequired: true
                    ),
                    FormField(
                        label: "Value",
                        type: .text,
                        value: "",
                        options: nil,
                        isRequired: false
                    )
                ],
                subtitle: "Name notable Achievements you can earn from the boardgame, ie. 'First Place' or 'The longest Road'. Some achievements come with point values, like longest Road in Catan."
            )
            
        )
    }
    
}



